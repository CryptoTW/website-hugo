#!/bin/sh

# If a command fails then the deploy stops
set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Clear Public folder (這行我註解掉了，請確定知道這個指令會執行什麼，再解除註解)
rm -r public

# Clone project
git clone https://github.com/CryptoTW/CryptoTW.github.io public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -s -m "$msg"

# Push source and build repos.
git push -u origin master
