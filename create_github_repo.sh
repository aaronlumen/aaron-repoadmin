#!/usr/bin/env bash
set -e
# Author: Aaron Surina
# May 12, 2025 - Monday
# This utility was created to make interactions from my linux terminal effortless and simple as well as efficient. 
# The idea is to share as many innovative tools as possible with the public to enhance free software and copywrongs.
# Distribute freely and effectively as you see fit and help those in need. 
# Dedicated to my two sons, DMS and AAS. 2012 - Present
#
# create_github_repo.sh
##
# Automatically create a GitHub repository named after the current directory,
# initialize a local Git repo, commit all files (including subdirectories),
# and push to GitHub via SSH or HTTPS.
########################################################################################################################
#
# Dependency check
for cmd in git curl; do
  if ! command -v "$cmd" >/dev/null; then
    echo "Error: '$cmd' is not installed." >&2
    exit 1
  fi
done
#
# Prompt for repository name (default: current directory)
#
default_name=$(basename "$(pwd)")
read -rp "Repository name [$default_name]: " repo_name
default_named=${repo_name:-$default_name}
repo_name=$default_named
#
# Prompt for description
#
read -rp "Repository description (optional): " repo_desc
#
# Prompt for visibility
#
read -rp "Private repository? [y/N]: " priv_choice
if [[ "$priv_choice" =~ ^[Yy] ]]; then
  private=true
else
  private=false
fi
#
# GitHub credentials
#
read -rp "GitHub username: " gh_user
read -sp "Personal Access Token (will not echo): " gh_token
echo
#
# Choose remote type
#
read -rp "Remote type (ssh/https) [ssh]: " remote_type
remote_type=${remote_type:-ssh}
#
# Create repository via GitHub API
#
echo "Creating GitHub repository using api integration: '$repo_name'..."
status=$(curl -s -o /dev/null -w "%{http_code}" -u "$gh_user:$gh_token" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$repo_name\",\"description\":\"$repo_desc\",\"private\":$private}")

if [[ "$status" != "201" ]]; then
  echo "Error: Failed to create repo (HTTP $status)." >&2
  exit 1
fi

echo "Repository '$repo_name' created on GitHub."
#
# Ensure no existing Git repo
#
if [[ -d .git ]]; then
  echo "Error: A Git repository already exists in this directory. Aborting." >&2
  exit 1
fi
#
# Initialize, commit, and push
#
echo "Initializing local repository..."
echo "git init"
git init
echo "git branch -M main"
git branch -M main
echo "git add ."
git add .
echo "git commit -m \"Initial commit by Aaron Surina\""
git commit -m "Initial commit by Aaron Surina "

echo "Adding remote origin..."
if [[ "$remote_type" == "ssh" ]]; then
  remote_url="git@github.com:$gh_user/$repo_name.git"
else
  remote_url="https://github.com/$gh_user/$repo_name.git"
fi

echo "git remote add origin \"$remote_url\""
git remote add origin "$remote_url"

echo "Pushing to GitHub ($remote_type)..."
echo "git push -u origin main"
git push -u origin main

echo "Success! Repository available at: $remote_url"
