#!/bin/bash

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

