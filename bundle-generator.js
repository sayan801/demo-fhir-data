/**
 * Bundle Generator for FHIR FSH Files
 * 
 * This script automatically generates a bundle FSH file that includes all resources
 * from the standard /input/fsh/ directory. It parses each FSH file to find Instance definitions
 * and creates a bundle containing references to each of them.
 * 
 * Usage: node bundle-generator.js or ./fhir-tools.sh bundle
 */

const fs = require('fs');
const path = require('path');

// Configuration
const FSH_DIR = './input/fsh';
const OUTPUT_FILE = './input/fsh/auto-bundle.fsh';
const BUNDLE_ID = 'auto-compiled-bundle';
const BUNDLE_TITLE = 'Automatically Compiled Bundle';
const BUNDLE_DESCRIPTION = 'Bundle containing all resources automatically compiled from FSH files';
const BUNDLE_TYPE = 'transaction';

/**
 * Extracts instance from the FSH content
 */
function findInstances(content, fileName) {
  const results = [];

  // Use regex to find Instance definitions
  const instanceMatches = content.matchAll(/Instance:\s+([A-Za-z0-9_-]+)[\s\S]*?InstanceOf:\s+([A-Za-z0-9_.-]+)/g);

  for (const match of instanceMatches) {
    const instanceName = match[1].trim();
    const resourceType = match[2].trim();

    // Skip adding the bundle we're creating to avoid circular references
    if (instanceName === BUNDLE_ID) {
      continue;
    }

    results.push({ instanceName, resourceType });
  }

  return results;
}

/**
 * Processes FSH files in a directory
 */
function processDirectory(dirPath, instances, resourceTypes) {
  let processedFiles = 0;
  let totalInstances = 0;

  try {
    // Get all FSH files in the directory, excluding the auto-bundle file
    const files = fs.readdirSync(dirPath)
      .filter(f => f.endsWith('.fsh'))
      .filter(f => f !== 'auto-bundle.fsh');

    files.forEach(file => {
      try {
        const filePath = path.join(dirPath, file);
        const content = fs.readFileSync(filePath, 'utf8');

        // Find instances in the file content
        const fileInstances = findInstances(content, file);

        // Add found instances to our maps
        fileInstances.forEach(({ instanceName, resourceType }) => {
          instances.set(instanceName, path.relative(FSH_DIR, filePath));
          resourceTypes.set(instanceName, resourceType);
          totalInstances++;
        });

        processedFiles++;
      } catch (error) {
        console.error(`Error processing file ${file}:`, error);
      }
    });
  } catch (error) {
    console.error(`Error reading directory ${dirPath}:`, error);
  }

  return { processedFiles, totalInstances };
}

/**
 * Finds all FSH files and extracts instance definitions
 */
function collectInstances() {
  const instances = new Map();
  const resourceTypes = new Map();
  let totalProcessedFiles = 0;
  let totalFoundInstances = 0;

  if (!fs.existsSync(FSH_DIR)) {
    console.error(`Error: Directory ${FSH_DIR} does not exist.`);
    process.exit(1);
  }

  // Process the main FSH directory
  const mainResult = processDirectory(FSH_DIR, instances, resourceTypes);
  totalProcessedFiles += mainResult.processedFiles;
  totalFoundInstances += mainResult.totalInstances;

  // Get all subdirectories inside input/fsh/
  const subDirs = fs.readdirSync(FSH_DIR, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory())
    .map(dirent => path.join(FSH_DIR, dirent.name));

  // Process each subdirectory
  subDirs.forEach(subDir => {
    const subResult = processDirectory(subDir, instances, resourceTypes);
    totalProcessedFiles += subResult.processedFiles;
    totalFoundInstances += subResult.totalInstances;
  });

  console.log(`Processed ${totalProcessedFiles} files and found ${totalFoundInstances} instances`);
  return { instances, resourceTypes, totalInstances: totalFoundInstances };
}

/**
 * Generates bundle FSH file content
 */
function createBundleFsh(instances, resourceTypes) {

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

  // Add entries to bundle for each instance
  const sortedInstances = [...instances.keys()].sort();
  sortedInstances.forEach(instanceName => {
    const resourceType = resourceTypes.get(instanceName);
    const sourceFile = instances.get(instanceName);

    bundleFsh += `
// Include ${instanceName} from ${sourceFile}
* entry[+].resource = ${instanceName}
* entry[=].fullUrl = "urn:uuid:${instanceName}"
* entry[=].request.method = #POST
* entry[=].request.url = "${resourceType}"
`;
  });

  return bundleFsh;
}

/**
 * Main function to run the bundle generator
 */
function main() {
  console.log('Bundle Generator - Starting...');


  if (!fs.existsSync(FSH_DIR)) {
    console.error(`Error: Directory ${FSH_DIR} does not exist.`);
    process.exit(1);
  }

  // Collect instances from all FSH files
  const { instances, resourceTypes, totalInstances } = collectInstances();

  // create the auto bundle FSH content
  const bundleFsh = createBundleFsh(instances, resourceTypes);

  // save the bundle FSH file
  try {
    fs.writeFileSync(OUTPUT_FILE, bundleFsh);
    console.log(`Successfully generated bundle at ${OUTPUT_FILE} with ${totalInstances} resources`);
  } catch (error) {
    console.error('Error writing output file:', error);
    process.exit(1);
  }

  console.log('Bundle Generator - Completed');
}

main();