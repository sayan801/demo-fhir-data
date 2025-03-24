# FHIR Resources Demo Project

This project contains FHIR resources in FSH format for a demo patient record.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/SHIFT-Task-Force/demo-fhir-data
   cd demo-fhir-data
   ```

2. Make the tools script executable:
   ```bash
   chmod +x fhir-tools.sh
   ```

## Working with FHIR Resources

### Quick Start

For a complete workflow that compiles and uploads resources to a local HAPI FHIR server:

```bash
# Start the HAPI FHIR server on local Docker
./fhir-tools.sh hapi-up

# Generate bundle, compile FSH files, and post to local HAPI server
./fhir-tools.sh deploy
```

Then visit http://localhost:8080/fhir to see your resources in the HAPI FHIR server.

### Step-by-Step Process

If you prefer to run commands individually:

1. **Generate a FSH bundle file** from all FSH files:
   ```bash
   ./fhir-tools.sh bundle
   ```

2. **Compile your FSH files** to FHIR JSON resources:
   ```bash
   ./fhir-tools.sh sushi
   ```

3. **Start the HAPI FHIR server** (if not already running):
   ```bash
   ./fhir-tools.sh hapi-up
   ```

4. **Post the bundle** to the HAPI FHIR server:
   ```bash
   ./fhir-tools.sh post
   ```

### Working with Your Server

To post to a specified FHIR server:

```bash
./fhir-tools.sh post http://example.com/fhir
```

Or for a complete deployment to an external server:

```bash
./fhir-tools.sh deploy http://example.com/fhir
```

## Available Commands

Run `./fhir-tools.sh help` to see all available commands:

- `bundle` - Generate the auto-bundle.fsh file
- `sushi` - Run sushi to compile all FSH files
- `post [SERVER_URL]` - Post the bundle to a FHIR server
- `hapi-up` - Start HAPI FHIR server on Docker
- `hapi-stop` - Stop the HAPI FHIR server on Docker
- `clean` - Remove generated files
- `deploy [SERVER_URL]` - Full deployment process
- `help` - Show help message

## Project Structure

- `input/fsh/` - Defualt FSH files
- `fsh-generated/` - Compiled FHIR resources (created by sushi)
- `bundle-generator.js` - Script to generate the bundle in FHIR format by retrieving all FSH resources in the input/fsh folder
- `fhir-tools.sh` - Utility script for common tasks

