#!/bin/bash

repo_url="https://reinoudb.github.io/charts"

# Prompt the user for the application name
read -p "Enter application name (e.g., jellyfin): " app_name

# Create a Helm chart using the provided application name
helm create "$app_name"

# Prompt the user for the Docker image
read -p "Enter Docker image (e.g., linuxserver/jellyfin): " docker_image

# Update the values.yaml file with the specified Docker image
values_file="$app_name/values.yaml"

if [[ -f "$values_file" ]]; then
  # Use sed to update the repository value in the values.yaml file
  sed -i "s|repository: .*|repository: $docker_image|" "$values_file"
  sed -i "s|tag: .*|tag: latest|" "$values_file"
else
  echo "Error: $values_file not found!"
  exit 1
fi

cd "$app_name"

# Package the Helm chart
helm package .

cd ..

# Update the Helm repo index
helm repo index --url "$repo_url" .

# Add the new Helm chart and package to Git
git add .

# Commit the changes with a message including the application name and Docker image
git commit -m "Added Helm chart for $app_name using Docker image $docker_image"

git push

# Inform the user that the process is complete
echo "Helm chart for $app_name created, packaged, and committed to Git with Docker image $docker_image."
