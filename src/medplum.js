const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { JSONPath } = require('jsonpath-plus');
const _ = require('lodash');
const dotenv = require('dotenv');

// Configuration
const BUNDLE_DIR = './fsh-generated/resources/';
const BOTS_HANDLERS_DIR = './bots_handlers/';

/**
 * Replace environment variable references in a string
 * @param {string} str - String that may contain env var references
 * @returns {string} - String with env vars replaced with actual values
 */
function replaceEnvVars(str) {
  if (typeof str !== 'string') return str;

  // Regex to match process.env.VARIABLE_NAME
  const envVarRegex = /process\.env\.([A-Za-z0-9_]+)/g;

  return str.replace(envVarRegex, (match, varName) => {
    const value = process.env[varName];
    if (value === undefined) {
      console.error(
        `Error: Environment variable ${varName} not found. Please add it to your .env file.`
      );
      process.exit(1);
    }
    return value;
  });
}

/**
 * Process an object recursively to replace env vars in all string properties
 * and update references in a single JSONPath pass
 * @param {any} obj - Object to process
 * @param {Map} referenceUpdates - Map of original references to updated ones
 */
function processObjectEnvVarsAndReferences(obj, referenceUpdates) {
  if (!obj || typeof obj !== 'object') return;

  // First process all Subscription resources
  processSubscriptions(obj, referenceUpdates);

  // Then process all references
  processReferences(obj, referenceUpdates);
}

/**
 * Process Subscription resources specifically
 * @param {Object} bundle - The bundle containing resources
 * @param {Map} referenceUpdates - Map of original references to updated ones
 */
function processSubscriptions(bundle, referenceUpdates) {
  if (!bundle.entry || !Array.isArray(bundle.entry)) return;

  for (const entry of bundle.entry) {
    if (
      entry.resource?.resourceType === 'Subscription' &&
      entry.resource.channel
    ) {
      const channel = entry.resource.channel;

      // Clean invalid properties
      const validChannelProps = ['type', 'endpoint', 'payload', 'header'];
      for (const key of Object.keys(channel)) {
        if (!validChannelProps.includes(key)) {
          console.warn(
            `Removing unexpected property '${key}' from Subscription.channel`
          );
          delete channel[key];
        }
      }

      // Process endpoint - handle both reference updates and environment variables
      if (channel.endpoint && typeof channel.endpoint === 'string') {
        if (
          channel.endpoint.startsWith('urn:uuid:') &&
          referenceUpdates.has(channel.endpoint)
        ) {
          channel.endpoint = referenceUpdates.get(channel.endpoint);
        } else if (channel.endpoint.includes('process.env.')) {
          channel.endpoint = replaceEnvVars(channel.endpoint);
        }
      }

      // Process headers for environment variables
      if (channel.header && Array.isArray(channel.header)) {
        channel.header = channel.header.map((header) => {
          if (typeof header === 'string' && header.includes('process.env.')) {
            return replaceEnvVars(header);
          }
          return header;
        });
      }
    }
  }
}

/**
 * Process all references in the bundle using JSONPath
 * @param {Object} obj - Object to process
 * @param {Map} referenceUpdates - Map of original references to updated ones
 */
function processReferences(obj, referenceUpdates) {
  if (!obj || typeof obj !== 'object') return;

  // Process environment variables in string fields
  processEnvVars(obj);

  // Use JSONPath to find all reference values in the object in a single pass
  JSONPath({
    path: '$..reference', // Search for all reference fields
    json: obj,
    resultType: 'all',
    callback: (result) => {
      if (result.value === null || typeof result.value !== 'string') return;

      const parent = result.parent;

      // Update reference if it exists in the referenceUpdates map
      if (parent && referenceUpdates && referenceUpdates.has(result.value)) {
        parent.reference = referenceUpdates.get(result.value);
      }
    },
  });
}

/**
 * Process all environment variables in string fields using Lodash
 * @param {Object} obj - Object to process
 */
function processEnvVars(obj) {
  if (!obj || typeof obj !== 'object') return;

  // Use Lodash to recursively process all values in the object
  _.forEach(obj, (value, key) => {
    if (typeof value === 'string' && value.includes('process.env.')) {
      // Replace environment variables in strings
      obj[key] = replaceEnvVars(value);
    } else if (_.isArray(value)) {
      // Process arrays with _.map for immutability
      obj[key] = _.map(value, (item) => {
        if (typeof item === 'string' && item.includes('process.env.')) {
          return replaceEnvVars(item);
        } else if (item && typeof item === 'object') {
          // Recursively process nested objects within arrays
          processEnvVars(item);
          return item;
        }
        return item;
      });
    } else if (value && typeof value === 'object') {
      // Recursively process nested objects
      processEnvVars(value);
    }
  });
}

/**
 * Generate a deterministic UUID v5 from a string
 * This ensures the same input string always produces the same UUID
 */
function generateUUID(input) {
  // Use a fixed namespace UUID (this is a random UUID that serves as our namespace)
  const NAMESPACE = '1b671a64-40d5-491e-99b0-da01ff1f3341';

  // Generate a UUID v5 using the input string and our namespace
  return crypto
    .createHash('sha1')
    .update(NAMESPACE)
    .update(input)
    .digest()
    .slice(0, 16)
    .toString('hex')
    .replace(/(.{8})(.{4})(.{4})(.{4})(.{12})/, '$1-$2-$3-$4-$5');
}

/**
 * Process Bot resource by loading its handler code
 * @param {Object} botResource - The Bot resource
 * @returns {Object} - The modified Bot resource with sourceCode.data
 */
function processBotResource(botResource) {
  if (!botResource.sourceCode || !botResource.sourceCode.id) {
    console.warn(
      `Bot resource ${botResource.id} missing sourceCode.id, skipping handler code processing`
    );
    return botResource;
  }

  const handlerFilePath = path.join(
    BOTS_HANDLERS_DIR,
    `${botResource.sourceCode.id}.ts`
  );

  // Check if file exists
  if (!fs.existsSync(handlerFilePath)) {
    console.error(`Error: Bot handler file not found at ${handlerFilePath}`);
    process.exit(1);
  }

  try {
    // Read the handler code
    let handlerCode = fs.readFileSync(handlerFilePath, 'utf8');

    // Replace environment variables in the handler code
    handlerCode = replaceEnvVars(handlerCode);

    // Convert to base64
    const base64Code = Buffer.from(handlerCode, 'utf8').toString('base64');

    // Add the code to the resource
    botResource.sourceCode.data = base64Code;

    console.log(`Successfully processed Bot handler for ${botResource.id}`);
    return botResource;
  } catch (error) {
    console.error(`Error processing Bot handler: ${error.message}`);
    process.exit(1);
  }
}

/**
 * Process the bundle file and modify it according to requirements
 */
function processBundleFile(bundleId, suffix, envFilePath) {
  // Load the specified environment file
  if (envFilePath && fs.existsSync(envFilePath)) {
    dotenv.config({ path: envFilePath, override: true });
    console.log(`Loaded environment variables from: ${envFilePath}`);
  } else {
    console.warn(
      `Environment file not found: ${envFilePath}, proceeding with current environment.`
    );
  }

  const originalFilePath = path.join(BUNDLE_DIR, `Bundle-${bundleId}.json`);
  const outputFilePath = path.join(
    BUNDLE_DIR,
    `Bundle-${bundleId}-medplum${suffix}.json`
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
    const fileContent = fs.readFileSync(originalFilePath, 'utf8');
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
        entry.request.method = 'POST';
      }

      // 2. Change request URL to just resourceType and add conditional create logic
      if (entry.request && entry.resource && entry.resource.resourceType) {
        entry.request.url = entry.resource.resourceType;

        // Remove differential element from StructureDefinition resources
        if (
          entry.resource.resourceType === 'StructureDefinition' &&
          entry.resource.differential
        ) {
          delete entry.resource.differential;
          console.log(
            'Removed differential element from StructureDefinition resource'
          );
        }

        // Special handling for Bot resources
        if (entry.resource.resourceType === 'Bot') {
          entry.resource = processBotResource(entry.resource);
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
              typeof id.system === 'string' &&
              typeof id.value === 'string'
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

  // Process environment variables and references in a single pass
  console.log('Processing environment variables and references...');
  processObjectEnvVarsAndReferences(bundle, referenceUpdates);

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
  // Get bundle ID, suffix, and env file from command line args
  const bundleId = process.argv[2];
  const suffix = process.argv[3] || '';
  const envFilePath = process.argv[4];

  if (!bundleId) {
    console.error('Error: No bundle ID provided');
    console.log('Usage: node medplum.js [bundle-id] [suffix] [env-file-path]');
    process.exit(1);
  }

  processBundleFile(bundleId, suffix, envFilePath);
}

// Execute the main function
main();
