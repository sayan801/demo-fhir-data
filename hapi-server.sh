#!/bin/bash
#  Local Docker HAPI FHIR Server (For Local Testing)

# Color codes for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Local HAPI FHIR server details
HAPI_URL="http://localhost:8080"
FHIR_ENDPOINT="http://localhost:8080/fhir"
DEFAULT_BUNDLE_FILE="fsh-generated/resources/Bundle-auto-compiled-bundle.json"

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

# Print error message
error() {
  echo -e "${RED}✗ $1${NC}"
}

# Show help
show_help() {
  echo "Local HAPI FHIR Server"
  echo ""
  echo "Usage: ./hapi-server.sh COMMAND"
  echo ""
  echo "Commands:"
  echo "  start                    Start the HAPI FHIR server on local docker"
  echo "  stop                     Stop and remove the HAPI FHIR server container"
  echo "  status                   Check status of local HAPI FHIR server"
  echo "  post                     Post the auto-bundle.fsh file to the HAPI FHIR server"
  echo "                           (uses $DEFAULT_BUNDLE_FILE)"
  echo "  help                     Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./hapi-server.sh start                          # Start HAPI FHIR server"
  echo "  ./hapi-server.sh post                           # Post bundle to HAPI"
  echo "  ./hapi-server.sh stop                           # Stop HAPI FHIR server"
  echo ""
  echo "Typical workflow:"
  echo "  1. Start server:        ./hapi-server.sh start"
  echo "  2. Post resources:      ./hapi-server.sh post"
  echo "  3. Stop server:         ./hapi-server.sh stop   # When done"
  echo ""
  echo "Server Details:"
  echo "  Server URL:             $HAPI_URL"
  echo "  FHIR Endpoint:          $FHIR_ENDPOINT"
  echo "  Bundle File:            $DEFAULT_BUNDLE_FILE"
  echo ""
}

# Start HAPI FHIR server on Docker
hapi_up() {
  section "Starting HAPI FHIR Server"
  
  # Check if container is already running
  if docker ps | grep -q hapi-fhir-server; then
    info "HAPI FHIR server is already running"
    info "Server is accessible at $HAPI_URL"
    info "FHIR endpoint: $FHIR_ENDPOINT"
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
    info "Server is accessible at $HAPI_URL"
    info "FHIR endpoint: $FHIR_ENDPOINT"
    info "To stop the server, run: ./hapi-server.sh stop"
  else
    error "Error starting HAPI FHIR server"
    exit 1
  fi
}

# Stop HAPI FHIR server on Docker
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

# Check HAPI FHIR server status
check_status() {
  section "HAPI FHIR Server Status"
  
  if docker ps | grep -q hapi-fhir-server; then
    success "HAPI FHIR server is running"
    info "Server is accessible at $HAPI_URL"
    info "FHIR endpoint: $FHIR_ENDPOINT"
  else
    if docker ps -a | grep -q hapi-fhir-server; then
      info "HAPI FHIR server container exists but is not running"
      info "To start it, run: ./hapi-server.sh start"
    else
      info "HAPI FHIR server is not installed"
      info "To install and start it, run: ./hapi-server.sh start"
    fi
  fi
}

# Post bundle to HAPI FHIR server
post_bundle() {
  local bundle_file=$DEFAULT_BUNDLE_FILE
  
  section "Posting Bundle to HAPI FHIR Server"
  
  # Check if server is running
  if ! docker ps | grep -q hapi-fhir-server; then
    error "HAPI FHIR server is not running"
    info "Start the server first with: ./hapi-server.sh start"
    exit 1
  fi
  
  # Check if bundle file exists
  if [ ! -f "$bundle_file" ]; then
    error "Bundle file not found: $bundle_file"
    info "The bundle file was not found. Make sure you have compiled your FSH files:"
    info "Run: ./fhir-tools.sh sushi"
    exit 1
  fi
  
  info "Posting bundle to $FHIR_ENDPOINT..."
  info "Using bundle file: $bundle_file"
  
  # Post the bundle to the FHIR server
  curl -X POST -H "Content-Type: application/fhir+json" \
    -d @"$bundle_file" \
    "$FHIR_ENDPOINT"
  
  if [ $? -eq 0 ]; then
    echo ""
    success "Bundle posted successfully to HAPI FHIR server"
  else
    echo ""
    error "Error posting bundle to HAPI FHIR server"
    exit 1
  fi
}

# Process command
case "$1" in
  start)
    hapi_up
    ;;
  stop)
    stop_hapi
    ;;
  status)
    check_status
    ;;
  post)
    post_bundle
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
    echo "Run './hapi-server.sh help' for usage information"
    exit 1
    ;;
esac

exit 0 