#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the parent directory of the script location
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Ensure the project directory exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Proejct directory does not exist: $PROJECT_DIR"
    exit 1
fi

# Overwrite/create environment.yml file with the current status
# Exclude build numbers for better compatibility across different systems
if conda env export --no-builds > "$PROJECT_DIR/environment.yml"; then
    echo "environment.yml has been updated at $PROJECT_DIR."
else
    echo "Failed to update environment.yml."
    exit 1
fi