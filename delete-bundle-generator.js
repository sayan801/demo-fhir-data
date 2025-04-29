/**
 * Delete Bundle Generator for FHIR Resources
 *
 * This script generates a transaction bundle that will delete all resources
 * created by a previous bundle. It reads the existing bundle and creates
 * DELETE operations for each resource.
 *
 * Usage: node delete-bundle-generator.js [bundle-id]
 * Example: node delete-bundle-generator.js auto-compiled-bundle-medplum
 */

const fs = require("fs");
const path = require("path");

// Configuration
const BUNDLE_DIR = "./fsh-generated/resources/";

/**
 * Process the source bundle file and create a deletion bundle
 */
function createDeletionBundle(bundleId) {
  const sourceBundlePath = path.join(BUNDLE_DIR, `Bundle-${bundleId}.json`);
  const outputFilePath = path.join(
    BUNDLE_DIR,
    `Bundle-${bundleId}-delete.json`
  );

  console.log(`Processing source bundle: ${sourceBundlePath}`);

  // Check if source file exists
  if (!fs.existsSync(sourceBundlePath)) {
    console.error(`Error: Source bundle file not found at ${sourceBundlePath}`);
    process.exit(1);
  }

  // Read the source bundle file
  let sourceBundle;
  try {
    const fileContent = fs.readFileSync(sourceBundlePath, "utf8");
    sourceBundle = JSON.parse(fileContent);
  } catch (error) {
    console.error(
      `Error reading or parsing source bundle file: ${error.message}`
    );
    process.exit(1);
  }

  // Validate source bundle
  if (!sourceBundle.entry || !Array.isArray(sourceBundle.entry)) {
    console.error("Error: Source bundle does not contain entries array");
    process.exit(1);
  }

  // Create the deletion bundle structure
  const deletionBundle = {
    resourceType: "Bundle",
    id: `${sourceBundle.id}-delete`,
    type: "transaction",
    entry: [],
  };

  // Add security meta tag if the source bundle had one
  if (sourceBundle.meta && sourceBundle.meta.security) {
    deletionBundle.meta = {
      security: sourceBundle.meta.security,
    };
  }

  // Process entries in reverse order (to handle dependencies properly)
  // This ensures resources are deleted in the opposite order they were created
  const entries = [...sourceBundle.entry].reverse();

  entries.forEach((entry) => {
    if (entry.resource && entry.resource.resourceType && entry.resource.id) {
      // For Medplum compatibility, use conditional delete with identifier if available
      const deleteRequest = {
        method: "DELETE",
        url: entry.resource.resourceType,
      };

      // Find a valid identifier to use for conditional delete in Medplum
      if (
        entry.resource.identifier &&
        Array.isArray(entry.resource.identifier)
      ) {
        const validIdentifier = entry.resource.identifier.find(
          (id) =>
            id.system &&
            id.value &&
            typeof id.system === "string" &&
            typeof id.value === "string"
        );

        if (validIdentifier) {
          // Use conditional delete with identifier
          deleteRequest.url += `?identifier=${validIdentifier.system}|${validIdentifier.value}`;
        } else {
          // Fallback to resource ID if no proper identifier is found
          deleteRequest.url += `/${entry.resource.id}`;
        }
      } else {
        // Fallback to resource ID if no identifiers array exists
        deleteRequest.url += `/${entry.resource.id}`;
      }

      // Add the delete entry to the bundle
      deletionBundle.entry.push({
        request: deleteRequest,
      });
    }
  });

  // Write the deletion bundle to a new file
  try {
    fs.writeFileSync(outputFilePath, JSON.stringify(deletionBundle, null, 2));
    console.log(`Successfully created deletion bundle: ${outputFilePath}`);
    console.log(
      `Bundle contains ${deletionBundle.entry.length} DELETE operations`
    );
  } catch (error) {
    console.error(`Error writing deletion bundle file: ${error.message}`);
    process.exit(1);
  }
}

/**
 * Main function
 */
function main() {
  // Get bundle ID from command line args
  const bundleId = process.argv[2];

  if (!bundleId) {
    console.error("Error: No bundle ID provided");
    console.log("Usage: node delete-bundle-generator.js [bundle-id]");
    console.log(
      "Example: node delete-bundle-generator.js auto-compiled-bundle-medplum"
    );
    process.exit(1);
  }

  createDeletionBundle(bundleId);
}

// Execute the main function
main();
