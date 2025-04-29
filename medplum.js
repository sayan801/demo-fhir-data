const fs = require("fs");
const path = require("path");
const crypto = require("crypto");
const { JSONPath } = require("jsonpath-plus");
const _ = require("lodash");

// Configuration
const BUNDLE_DIR = "./fsh-generated/resources/";

/**
 * Generate a deterministic UUID v5 from a string
 * This ensures the same input string always produces the same UUID
 */
function generateUUID(input) {
  // Use a fixed namespace UUID (this is a random UUID that serves as our namespace)
  const NAMESPACE = "1b671a64-40d5-491e-99b0-da01ff1f3341";

  // Generate a UUID v5 using the input string and our namespace
  return crypto
    .createHash("sha1")
    .update(NAMESPACE)
    .update(input)
    .digest()
    .slice(0, 16)
    .toString("hex")
    .replace(/(.{8})(.{4})(.{4})(.{4})(.{12})/, "$1-$2-$3-$4-$5");
}

/**
 * Process the bundle file and modify it according to requirements
 */
function processBundleFile(bundleId) {
  const originalFilePath = path.join(BUNDLE_DIR, `Bundle-${bundleId}.json`);
  const outputFilePath = path.join(
    BUNDLE_DIR,
    `Bundle-${bundleId}-medplum.json`
  );

  console.log(`Processing bundle file: ${originalFilePath}`);

  // Check if file exists
  if (!fs.existsSync(originalFilePath)) {
    console.error(`Error: Bundle file not found at ${originalFilePath}`);
    process.exit(1);
  }

  // Read the bundle file
  let bundle;
  try {
    const fileContent = fs.readFileSync(originalFilePath, "utf8");
    bundle = JSON.parse(fileContent);
  } catch (error) {
    console.error(`Error reading or parsing bundle file: ${error.message}`);
    process.exit(1);
  }

  // Cache for consistent UUID generation (same ID should get same UUID)
  const uuidCache = new Map();
  // Track reference updates that need to be made
  const referenceUpdates = new Map();

  // Modify the bundle entries
  if (bundle.entry && Array.isArray(bundle.entry)) {
    bundle.entry.forEach((entry) => {
      // 1. Change request method to POST
      if (entry.request) {
        entry.request.method = "POST";
      }

      // 2. Change request URL to just resourceType and add conditional create logic
      if (entry.request && entry.resource && entry.resource.resourceType) {
        entry.request.url = entry.resource.resourceType;

        // Remove differential element from StructureDefinition resources
        if (
          entry.resource.resourceType === "StructureDefinition" &&
          entry.resource.differential
        ) {
          delete entry.resource.differential;
          console.log(
            "Removed differential element from StructureDefinition resource"
          );
        }

        if (
          entry.resource.identifier &&
          Array.isArray(entry.resource.identifier)
        ) {
          // Find an identifier with both system and value
          const validIdentifier = entry.resource.identifier.find(
            (id) =>
              id.system &&
              id.value &&
              typeof id.system === "string" &&
              typeof id.value === "string"
          );

          if (validIdentifier) {
            // Add ifNoneExist parameter for conditional create
            entry.request.ifNoneExist = `identifier=${validIdentifier.system}|${validIdentifier.value}`;
          }
        }
      }

      // 3. Change fullUrl to use UUID
      if (entry.fullUrl) {
        let originalFullUrl = entry.fullUrl;
        let uuid;
        if (uuidCache.has(originalFullUrl)) {
          uuid = uuidCache.get(originalFullUrl);
        } else {
          uuid = generateUUID(originalFullUrl);
          uuidCache.set(originalFullUrl, uuid);
        }

        // Update the fullUrl
        entry.fullUrl = `urn:uuid:${uuid}`;

        // Store the reference mapping for updating references later
        referenceUpdates.set(originalFullUrl, `urn:uuid:${uuid}`);
      }
    });
  }

  // Use JSONPath to find and update all references in the bundle
  JSONPath({
    path: "$..reference",
    json: bundle,
    resultType: "value",
    callback: (value, _type, { parent }) => {
      if (typeof value === "string" && referenceUpdates.has(value)) {
        parent.reference = referenceUpdates.get(value);
      }
    },
  });

  // Write the modified bundle to a new file with -medplum suffix
  try {
    fs.writeFileSync(outputFilePath, JSON.stringify(bundle, null, 2));
    console.log(`Successfully created modified bundle file: ${outputFilePath}`);
  } catch (error) {
    console.error(`Error writing modified bundle file: ${error.message}`);
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
    console.log("Usage: node medplum.js [bundle-id]");
    console.log("Example: node medplum.js auto-compiled-bundle");
    process.exit(1);
  }

  processBundleFile(bundleId);
}

// Execute the main function
main();
