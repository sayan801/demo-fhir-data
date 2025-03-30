# FHIR Resources Demo Project

This project contains FHIR resources in FSH format for a demo patient record.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/SHIFT-Task-Force/demo-fhir-data
   cd demo-fhir-data
   ```

2. Make the scripts executable:
   ```bash
   chmod +x fhir-tools.sh hapi-server.sh
   ```

## Working with FHIR Resources

### Quick Start

For working with a local HAPI FHIR server instance:

1. **Start the local HAPI FHIR server**:
   ```bash
   ./hapi-server.sh start
   ```

2. **Generate bundle and post to local server** (all-in-one command):
   ```bash
   ./hapi-server.sh post
   ```
   
   This is equivalent to running:
   ```bash
   ./fhir-tools.sh deploy http://localhost:8080/fhir
   ```

3. Visit http://localhost:8080 to see your resources in the HAPI FHIR server.

4. **Stop the HAPI FHIR server** when done:
   ```bash
   ./hapi-server.sh stop
   ```

### Using FHIR Servers

For deploying to a FHIR server:

1. **Generate bundle and post to a FHIR server** (all-in-one command):
   ```bash
   ./fhir-tools.sh deploy http://example.com/fhir
   ```

2. **Or perform steps individually**:
   
   a. Generate a bundle from all FSH files:
   ```bash
   ./fhir-tools.sh bundle
   ```

   b. Compile your FSH files to FHIR JSON resources:
   ```bash
   ./fhir-tools.sh sushi
   ```

   c. Post the bundle to your FHIR server:
   ```bash
   ./fhir-tools.sh post http://example.com/fhir
   ```

### Verification of POST Requests

When posting resources to any FHIR server, the script automatically verifies the HTTP status code:
- Success (2xx status codes) is clearly indicated with a success message
- Failures are reported with the status code for troubleshooting

### Cleaning Up

To clean all generated files:
```bash
./fhir-tools.sh clean
```

## Available Commands

### FHIR Resources Management

Run `./fhir-tools.sh help` to see all available commands:

### Local HAPI Server Management

Run `./hapi-server.sh help` to see all available commands:


## Project Structure

- `input/fsh/` - Default FSH files
- `fsh-generated/` - Compiled FHIR resources (created by sushi)
- `bundle-generator.js` - Script to generate the bundle in FSH format
- `fhir-tools.sh` - Utility script for managing FHIR resources
- `hapi-server.sh` - Utility script for managing local HAPI FHIR server
- `sushi-config.yaml` - Configuration for SUSHI compiler
