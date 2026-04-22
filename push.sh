#!/bin/bash

# Colors for better UI
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to display error and exit
error_exit() {
    echo -e "${RED}${BOLD}Error:${NC} $1"
    exit 1
}

# Check if it's a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    error_exit "Not a git repository."
fi

# Check for changes
if [[ -z $(git status -s) ]]; then
    echo -e "${YELLOW}No changes to push.${NC}"
    exit 0
fi

echo -e "${CYAN}${BOLD}--- Git Push Helper ---${NC}"

# Get commit message
read -p "Enter commit message: " commit_msg

# If empty, use a default one
if [[ -z "$commit_msg" ]]; then
    commit_msg="Update: $(date +'%Y-%m-%d %H:%M:%S')"
    echo -e "${YELLOW}No message provided. Using default: ${NC}$commit_msg"
fi

# Get current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Execution
echo -e "${CYAN}Staging all changes...${NC}"
git add . || error_exit "Failed to stage files."

echo -e "${CYAN}Committing changes...${NC}"
git commit -m "$commit_msg" || error_exit "Failed to commit."

echo -e "${CYAN}Pushing to origin/${current_branch}...${NC}"
if git push origin "$current_branch"; then
    echo -e "${GREEN}${BOLD}Successfully pushed to origin/$current_branch!${NC}"
else
    error_exit "Failed to push to remote."
fi