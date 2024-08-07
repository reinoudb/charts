#!/bin/bash

# Find all Chart.yaml files in subdirectories
find . -type f -name "Chart.yaml" | while read chart_file; do
  # Extract the version line
  version_line=$(grep "^version:" "$chart_file")

  # Extract the version number
  version=$(echo $version_line | awk '{print $2}')

  # Separate the version into major, minor, and patch
  IFS='.' read -r major minor patch <<< "$version"

  # Increment the patch number
  patch=$((patch + 1))

  # Construct the new version
  new_version="$major.$minor.$patch"

  # Replace the version in the file
  sed -i "s/^version: .*/version: $new_version/" "$chart_file"

  echo "Updated $chart_file from version $version to $new_version"
done

# Check if helm is installed
if ! command -v helm &> /dev/null
then
    echo "Helm is not installed. Please install it and run this script again."
    exit 1
fi

# Loop through each subfolder in the current directory
for dir in */ ; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
        echo "Packaging Helm chart in directory: $dir"
        cd "$dir"
        
        # Run helm package in the subdirectory
        if helm package .; then
            echo "Successfully packaged Helm chart in $dir"
        else
            echo "Failed to package Helm chart in $dir"
        fi
        
        # Go back to the main directory
        cd ..
    fi
done

repo_url="https://reinoudb.github.io/charts"

helm repo index --url "$repo_url" .

git add .
git commit -m "Updated applications and reindexed everything"
git push

echo "Helm packaging process completed and pushed to git"

