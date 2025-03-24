/**
 * Bundle Generator for FHIR FSH Files
 * 
 * This script automatically generates a bundle FSH file that includes all resources
 * from your /input/fsh files. It parses each FSH file to find Instance definitions
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

// Initialize bundle FSH content
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

// Maps to track instances and their resource types
const instances = new Map();
const resourceTypes = new Map();

console.log('Bundle Generator - Starting...');

// Check if FSH directory exists
if (!fs.existsSync(FSH_DIR)) {
  console.error(`Error: Directory ${FSH_DIR} does not exist.`);
  process.exit(1);
}

// Get all FSH files
const files = fs.readdirSync(FSH_DIR).filter(f => f.endsWith('.fsh'));
console.log(`Found ${files.length} FSH files`);

let processedFiles = 0;
let totalInstances = 0;

files.forEach(file => {
  try {
    const filePath = path.join(FSH_DIR, file);
    const content = fs.readFileSync(filePath, 'utf8');
    
    // Use regex to find Instance definitions
    const instanceMatches = content.matchAll(/Instance:\s+([A-Za-z0-9_-]+)[\s\S]*?InstanceOf:\s+([A-Za-z0-9_.-]+)/g);
    
    for (const match of instanceMatches) {
      const instanceName = match[1].trim();
      const resourceType = match[2].trim();
      
      // Skip adding the bundle we're creating to avoid circular references
      if (instanceName === BUNDLE_ID) {
        continue;
      }
      
      // Store instance & resource type
      instances.set(instanceName, file);
      resourceTypes.set(instanceName, resourceType);
      totalInstances++;
    }
    
    processedFiles++;
    
  } catch (error) {
    console.error(`Error processing file ${file}:`, error);
  }
});

console.log(`Processed ${processedFiles} files and found ${totalInstances} instances`);

// Add entries to bundle for each instance
const sortedInstances = [...instances.keys()].sort();
sortedInstances.forEach(instanceName => {
  const resourceType = resourceTypes.get(instanceName);
  const sourceFile = instances.get(instanceName);
  
  bundleFsh += `
// Include ${instanceName} from ${sourceFile}
* entry[+].resource = ${instanceName}
* entry[=].fullUrl = "urn:uuid:${instanceName}"
* entry[=].request.method = #PUT
* entry[=].request.url = "${resourceType}/${instanceName}"
`;
});

// Write the bundle to file
try {
  fs.writeFileSync(OUTPUT_FILE, bundleFsh);
  console.log(`Successfully generated bundle at ${OUTPUT_FILE} with ${totalInstances} resources`);
} catch (error) {
  console.error('Error writing output file:', error);
  process.exit(1);
}

console.log('Bundle Generator - Completed'); 