#!/bin/bash

# Prompt the user for a Docker string
read -p "Enter Docker string (e.g., linuxserver/jellyfin): " docker_string

# Create a Helm chart using the provided Docker string
helm create "$docker_string"

# Add the new Helm chart to Git
git add "$docker_string"

# Commit the changes with a message including the Docker string
git commit -m "Added $docker_string"
git push

# Inform the user that the process is complete
echo "Helm chart for $docker_string created and committed to Git."

