#!/bin/bash
# A command line tool to generate bundles, compile FSH files, and deploy resources to a HAPI server

# Default hapi local server
DEFAULT_SERVER_URL="http://localhost:8080/fhir"

# Color codes for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Print section header
section() {
  echo -e "\n${BLUE}==== $1 ====${NC}"
}

# Print success message
success() {
  echo -e "${GREEN}✓ $1${NC}"
}

# Print info message
info() {
  echo -e "${YELLOW}ℹ $1${NC}"
}

# Show help
show_help() {
  echo "FHIR Resources Tools"
  echo ""
  echo "Usage: ./fhir-tools.sh COMMAND [OPTIONS]"
  echo ""
  echo "Commands:"
  echo "  bundle              Generate the auto-bundle.fsh file"
  echo "  sushi               Run Sushi to compile all FSH files"
  echo "  post [SERVER_URL]   Post the bundle to a FHIR server (default: $DEFAULT_SERVER_URL)"
  echo "  hapi-up             Start HAPI FHIR server on Docker (http://localhost:8080)"
  echo "  hapi-stop           Stop the HAPI FHIR server on Docker"
  echo "  clean               Remove generated files (bundle and compiled JSON files)"
  echo "  deploy [SERVER_URL] Generate, compile, and post the bundle (starts HAPI FHIR server if posting locally)"
  echo "  help                Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./fhir-tools.sh bundle                     # Generate auto-bundle.fsh file"
  echo "  ./fhir-tools.sh post                       # Post to default server (http://localhost:8080/fhir)"
  echo "  ./fhir-tools.sh post http://example.com/fhir  # Post to specific server"
  echo "  ./fhir-tools.sh deploy                     # Full deployment to local server"
  echo ""
}

# Generate auto-bundle from all FSH files
generate_bundle() {
  section "Generating Bundle"
  node bundle-generator.js
  if [ $? -eq 0 ]; then
    success "Bundle generated successfully"
  else
    echo "Error generating bundle"
    exit 1
  fi
}

# Compile FSH files with Sushi
run_sushi() {
  section "Compiling FSH Files with Sushi"
  sushi .
  if [ $? -eq 0 ]; then
    success "FSH files compiled successfully"
  else
    echo "Error compiling FSH files"
    exit 1
  fi
}

# Post bundle to FHIR server
post_bundle() {
  local server_url=${1:-$DEFAULT_SERVER_URL}
  section "Posting Bundle to $server_url"
  
  # Check if the bundle file exists
  if [ ! -f "fsh-generated/resources/Bundle-auto-compiled-bundle.json" ]; then
    echo "Bundle file not found. Please generate and compile the bundle first."
    echo "Run: ./fhir-tools.sh bundle && ./fhir-tools.sh sushi"
    exit 1
  fi
  
  # Post the bundle to the FHIR server
  curl -X POST -H "Content-Type: application/fhir+json" \
    -d @fsh-generated/resources/Bundle-auto-compiled-bundle.json \
    "$server_url"
  
  if [ $? -eq 0 ]; then
    echo ""
    success "Bundle posted successfully to $server_url"
  else
    echo ""
    echo "Error posting bundle to $server_url"
    exit 1
  fi
}

# Start HAPI FHIR server on Docker locally
hapi_up() {
  section "Starting HAPI FHIR Server"
  
  # Check if container is already running
  if docker ps | grep -q hapi-fhir-server; then
    info "HAPI FHIR server is already running"
    return 0
  fi
  
  # Check if container exists but is stopped
  if docker ps -a | grep -q hapi-fhir-server; then
    info "HAPI FHIR container exists but is not running. Starting it..."
    docker start hapi-fhir-server
  else
    info "Creating and starting HAPI FHIR server container..."
    docker run --name hapi-fhir-server -d -p 8080:8080 hapiproject/hapi:latest
  fi
  
  if [ $? -eq 0 ]; then
    success "HAPI FHIR server started successfully"
    info "Server is accessible at http://localhost:8080"
    info "To stop the server, run: ./fhir-tools.sh hapi-stop"
  else
    echo "Error starting HAPI FHIR server"
    exit 1
  fi
}

# Stop HAPI FHIR server on Docker locally
stop_hapi() {
  section "Stopping HAPI FHIR Server"
  
  # Check if container is running
  if ! docker ps | grep -q hapi-fhir-server; then
    info "HAPI FHIR server is not running"
  else
    docker stop hapi-fhir-server
    success "HAPI FHIR server stopped"
  fi
  
  # Check if container exists
  if docker ps -a | grep -q hapi-fhir-server; then
    info "Removing HAPI FHIR server container..."
    docker rm hapi-fhir-server
    success "HAPI FHIR server container removed"
  fi
}

# Clean generated files
clean_files() {
  section "Cleaning Generated Files"
  
  if [ -f "./input/fsh/auto-bundle.fsh" ]; then
    rm -f ./input/fsh/auto-bundle.fsh
    success "Removed auto-bundle.fsh"
  else
    info "auto-bundle.fsh not found, nothing to remove"
  fi
  
  if [ -d "./fsh-generated" ]; then
    rm -rf ./fsh-generated
    success "Removed fsh-generated directory"
  else
    info "fsh-generated directory not found, nothing to remove"
  fi
  
  success "Cleanup completed"
}

# Full process
deploy() {
  local server_url=${1:-$DEFAULT_SERVER_URL}
  
  # If posting to localhost, ensure HAPI server is running
  if [[ "$server_url" == *"localhost"* ]] || [[ "$server_url" == *"127.0.0.1"* ]]; then
    hapi_up
    
    # Wait for server to initialize
    info "Waiting 5 seconds for server to initialize..."
    sleep 5
  else
    info "Deploying to external server: $server_url"
  fi
  
  # Generate bundle
  generate_bundle
  
  # Compile FSH files
  run_sushi
  
  # Post bundle
  post_bundle "$server_url"
  
  section "Deployment Completed"
  success "Full deployment completed successfully!"
  
  if [[ "$server_url" == *"localhost"* ]] || [[ "$server_url" == *"127.0.0.1"* ]]; then
    info "You can access the FHIR server at http://localhost:8080"
  fi
}

# Commands
case "$1" in
  bundle)
    generate_bundle
    ;;
  sushi)
    run_sushi
    ;;
  post)
    post_bundle "$2"
    ;;
  hapi-up)
    hapi_up
    ;;
  hapi-stop)
    stop_hapi
    ;;
  clean)
    clean_files
    ;;
  deploy)
    deploy "$2"
    ;;
  help|--help|-h)
    show_help
    ;;
  "")
    # No command provided, show help
    show_help
    exit 1
    ;;
  *)
    echo "Unknown command: $1"
    echo "Run './fhir-tools.sh help' for usage information"
    exit 1
    ;;
esac

exit 0 