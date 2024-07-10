#!/bin/bash

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
else
  echo "Error: $values_file not found!"
  exit 1
fi

# Add the new Helm chart to Git
git add "$app_name"

# Commit the changes with a message including the application name and Docker image
git commit -m "Added Helm chart for $app_name using Docker image $docker_image"

# Inform the user that the process is complete
echo "Helm chart for $app_name created and committed to Git with Docker image $docker_image."

