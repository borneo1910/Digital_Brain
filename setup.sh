#!/bin/bash
# setup.sh — Run this once to push your digital brain to GitHub
# Usage: ./setup.sh YOUR_GITHUB_USERNAME

if [ -z "$1" ]; then
  echo "Usage: ./setup.sh YOUR_GITHUB_USERNAME"
  exit 1
fi

GITHUB_USER=$1
REPO_NAME="digital-brain"

echo "🧠 Setting up your Digital Brain repo..."

# Initialize git
git init
git add .
git commit -m "init: digital brain — AI-accessible knowledge base"

# Create the repo on GitHub (requires GitHub CLI — install with: brew install gh)
echo ""
echo "Creating private GitHub repo..."
gh repo create "$REPO_NAME" --private --source=. --remote=origin --push

echo ""
echo "✅ Done! Your digital brain is live at:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "Next steps:"
echo "  1. Open the repo and verify all files look correct"
echo "  2. In Claude, start sessions by referencing: https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/context/profile.md"
echo "  3. In Cursor, add this repo as a workspace folder alongside your code projects"
echo "  4. Update context/relationships.md and memory/open-questions.md as things evolve"
