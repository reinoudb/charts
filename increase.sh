#!/bin/sh

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


