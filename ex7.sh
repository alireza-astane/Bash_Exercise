#!/bin/bash

# Enable debugging if needed (uncomment the next line)
# set -x

# Define the input file containing repository SSH addresses
REPO_FILE="repos.txt"

# Create a base directory for cloning repositories
BASE_DIR="cloned_repos"

# Function to clean up cloned repositories
cleanup() {
    echo "Removing all cloned repositories in $BASE_DIR ..."
    rm -rf "$BASE_DIR"
    echo "Cleanup completed."
    exit 0
}

# Check for cleanup option
if [[ "$1" == "--cleanup" ]]; then
    cleanup
fi

# Check if the file exists and is not empty
if [[ ! -f "$REPO_FILE" ]]; then
    echo "Error: $REPO_FILE not found!"
    exit 1
elif [[ ! -s "$REPO_FILE" ]]; then
    echo "Error: $REPO_FILE is empty!"
    exit 1
fi

# Create the base directory if it does not exist
mkdir -p "$BASE_DIR"

# Read each repository SSH address from the file and clone it
while IFS= read -r repo || [[ -n "$repo" ]]; do
    # Skip empty lines
    if [[ -z "$repo" ]]; then
        continue
    fi

    # Remove possible carriage return characters
    repo=$(echo "$repo" | tr -d '\r')

    # Extract the repository name
    repo_name=$(basename "$repo" .git)

    echo "Cloning $repo into $BASE_DIR/$repo_name ..."

    # Clone the repository
    if git clone "$repo" "$BASE_DIR/$repo_name"; then
        echo "Successfully cloned $repo_name"
    else
        echo "Failed to clone $repo_name"
    fi
done < "$REPO_FILE"

echo "All repositories have been processed."
