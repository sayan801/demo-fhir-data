/**
 * Medplum Bundle Modifier
 *
 * This script modifies a generated FHIR bundle JSON file to:
 * 1. Set all request methods to "POST"
 * 2. Set all request URLs to just the resourceType (without ID)
 * 3. Convert all fullUrl instance IDs to consistent UUIDs
 *
 * Usage: node medplum.js [bundle-id]
 * Example: node medplum.js auto-compiled-bundle
 */

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

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

  // Modify the bundle entries
  if (bundle.entry && Array.isArray(bundle.entry)) {
    bundle.entry.forEach((entry) => {
      // 1. Change request method to POST
      if (entry.request) {
        entry.request.method = "POST";
      }

      // 2. Change request URL to just resourceType
      if (entry.request && entry.resource && entry.resource.resourceType) {
        entry.request.url = entry.resource.resourceType;
      }

      // 3. Change fullUrl to use UUID
      if (entry.fullUrl && entry.fullUrl.startsWith("urn:uuid:")) {
        const instanceId = entry.fullUrl.substring(9); // Remove 'urn:uuid:' prefix

        // Get or generate UUID for this instance ID
        let uuid;
        if (uuidCache.has(instanceId)) {
          uuid = uuidCache.get(instanceId);
        } else {
          uuid = generateUUID(instanceId);
          uuidCache.set(instanceId, uuid);
        }

        // Update the fullUrl
        entry.fullUrl = `urn:uuid:${uuid}`;

        // Also update all references to this resource within the bundle
        updateReferences(bundle, `urn:uuid:${instanceId}`, `urn:uuid:${uuid}`);
      }
    });
  }

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
 * Update all references in the bundle
 */
function updateReferences(obj, oldRef, newRef) {
  if (!obj || typeof obj !== "object") return;

  // Handle arrays
  if (Array.isArray(obj)) {
    for (let i = 0; i < obj.length; i++) {
      updateReferences(obj[i], oldRef, newRef);
    }
    return;
  }

  // Process object keys
  for (const key in obj) {
    // Check for reference properties
    if (
      key === "reference" &&
      typeof obj[key] === "string" &&
      obj[key] === oldRef
    ) {
      obj[key] = newRef;
    }
    // Recursively process nested objects
    else if (typeof obj[key] === "object") {
      updateReferences(obj[key], oldRef, newRef);
    }
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
