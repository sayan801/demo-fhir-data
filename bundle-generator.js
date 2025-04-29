/**
 * Bundle Generator for FHIR FSH Files
 *
 * This script automatically generates a bundle FSH file that includes all resources
 * from the standard /input/fsh/ directory. It parses each FSH file to find Instance definitions
 * and creates a bundle containing references to each of them.
 *
 * Usage: node bundle-generator.js or ./fhir-tools.sh bundle
 */

const fs = require("fs");
const path = require("path");

// Configuration
const FSH_DIR = "./input/fsh";
const OUTPUT_FILE = "./input/fsh/auto-bundle.fsh";
const BUNDLE_ID = "auto-compiled-bundle";
const BUNDLE_TITLE = "Automatically Compiled Bundle";
const BUNDLE_DESCRIPTION =
  "Bundle containing all resources automatically compiled from FSH files";
const BUNDLE_TYPE = "transaction";

/**
 * Extracts resources from the FSH content based on a pattern
 */
function findResources(content, pattern, resourceTypeMapper) {
  const results = [];
  const matches = content.matchAll(pattern);

  for (const match of matches) {
    const name = match[1].trim();
    const resourceType = resourceTypeMapper(match);

    // Skip adding the bundle we're creating to avoid circular references
    if (name === BUNDLE_ID) {
      continue;
    }

    results.push({ name, resourceType });
  }

  return results;
}

/**
 * Extracts instance from the FSH content
 */
function findInstances(content) {
  return findResources(
    content,
    /Instance:\s+([A-Za-z0-9_-]+)[\s\S]*?InstanceOf:\s+([A-Za-z0-9_.-]+)/g,
    (match) => match[2].trim()
  );
}

/**
 * Extracts profiles from the FSH content
 */
function findProfiles(content) {
  return findResources(
    content,
    /Profile:\s+([A-Za-z0-9_-]+)[\s\S]*?Parent:\s+([A-Za-z0-9_.-]+)/g,
    () => "StructureDefinition"
  );
}

/**
 * Finds all FSH files and extracts resource definitions
 * @param {Object} resourceFinders - Object mapping resource type names to finder functions
 * @returns {Object} Object containing allResources (sorted array) and totalResourcesByType (map)
 */
function collectResources(resourceFinders) {
  const resources = new Map();
  const resourceTypes = new Map();
  const totalResourcesByType = new Map();
  let totalProcessedFiles = 0;

  if (!fs.existsSync(FSH_DIR)) {
    console.error(`Error: Directory ${FSH_DIR} does not exist.`);
    process.exit(1);
  }

  // Initialize total counts for each resource type
  Object.keys(resourceFinders).forEach((type) => {
    totalResourcesByType.set(type, 0);
  });

  // Process the main FSH directory and all subdirectories
  const dirsToProcess = [FSH_DIR];

  // Get all subdirectories inside input/fsh/
  const subDirs = fs
    .readdirSync(FSH_DIR, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => path.join(FSH_DIR, dirent.name));

  // Add subdirectories to the processing list
  dirsToProcess.push(...subDirs);

  // Process each directory
  dirsToProcess.forEach((dirPath) => {
    try {
      // Get all FSH files in the directory, excluding the auto-bundle file
      const files = fs
        .readdirSync(dirPath)
        .filter((f) => f.endsWith(".fsh") && f !== "auto-bundle.fsh");

      files.forEach((file) => {
        try {
          const filePath = path.join(dirPath, file);
          const content = fs.readFileSync(filePath, "utf8");

          // Apply each finder function to the content
          Object.entries(resourceFinders).forEach(
            ([typeName, findFunction]) => {
              const foundResources = findFunction(content);

              // Add found resources to our maps
              foundResources.forEach(({ name, resourceType }) => {
                resources.set(name, {
                  path: path.relative(FSH_DIR, filePath),
                  type: typeName,
                  resourceType,
                });
                resourceTypes.set(name, resourceType);
                totalResourcesByType.set(
                  typeName,
                  totalResourcesByType.get(typeName) + 1
                );
              });
            }
          );

          totalProcessedFiles++;
        } catch (error) {
          console.error(`Error processing file ${file}:`, error);
        }
      });
    } catch (error) {
      console.error(`Error reading directory ${dirPath}:`, error);
    }
  });

  // Log summary
  Object.keys(resourceFinders).forEach((type) => {
    console.log(`Found ${totalResourcesByType.get(type)} ${type}`);
  });
  console.log(`Processed ${totalProcessedFiles} files in total`);

  // Create a sorted array of all resources
  const allResources = Array.from(resources.entries())
    .map(([name, info]) => ({
      name,
      type: info.type,
      resourceType: resourceTypes.get(name),
      sourceFile: info.path,
    }))
    .sort((a, b) => {
      // Sort by type first (profiles before instances) then by name
      if (a.type === "profiles" && b.type !== "profiles") return -1;
      if (a.type !== "profiles" && b.type === "profiles") return 1;
      return a.name.localeCompare(b.name);
    });

  return {
    allResources,
    resourceTypes,
    totalResourcesByType,
  };
}

/**
 * Generates bundle FSH file content
 */
function createBundleFsh(resources) {
  // Initialize bundle FSH content with header
  let bundleFsh = `// Auto-generated Bundle - DO NOT EDIT MANUALLY
// Generated on ${new Date().toISOString()} by bundle-generator.js

Instance: ${BUNDLE_ID}
InstanceOf: Bundle
Title: "${BUNDLE_TITLE}"
Description: "${BUNDLE_DESCRIPTION}"
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #${BUNDLE_TYPE}
`;

  // Add entries for all resources
  if (resources.length > 0) {
    bundleFsh += "\n// Adding Resources\n";

    resources.forEach((resource) => {
      bundleFsh += `
// Include ${resource.type} ${resource.name} from ${resource.sourceFile}
* entry[+].resource = ${resource.name}
* entry[=].fullUrl = "urn:uuid:${resource.name}"
* entry[=].request.method = #POST
* entry[=].request.url = "${resource.resourceType}"
`;
    });
  }

  return bundleFsh;
}

/**
 * Main function to run the bundle generator
 */
function main() {
  console.log("Bundle Generator - Starting...");

  if (!fs.existsSync(FSH_DIR)) {
    console.error(`Error: Directory ${FSH_DIR} does not exist.`);
    process.exit(1);
  }

  // Collect all resources (profiles and instances) with a single call
  const { allResources, resourceTypes, totalResourcesByType } =
    collectResources({
      profiles: findProfiles,
      instances: findInstances,
    });

  // Create the auto bundle FSH content
  const bundleFsh = createBundleFsh(allResources);

  // Save the bundle FSH file
  try {
    fs.writeFileSync(OUTPUT_FILE, bundleFsh);
    console.log(
      `Successfully generated bundle at ${OUTPUT_FILE} with ${
        totalResourcesByType.get("instances") || 0
      } instances and ${totalResourcesByType.get("profiles") || 0} profiles`
    );
  } catch (error) {
    console.error("Error writing output file:", error);
    process.exit(1);
  }

  console.log("Bundle Generator - Completed");
}

main();
