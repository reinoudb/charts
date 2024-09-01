# Ajuin Helm Chart Repository
Welcome to the Ajuin Helm Chart Repository! This repository contains a collection of Helm charts for deploying various applications on Kubernetes.

# Adding the Ajuin Repository
To add the Ajuin repository to your Helm client, use the following command:

`helm repo add ajuin https://reinoudb.github.io/charts/`

# Usage
Once you've added the repository, you can deploy charts from the Ajuin repository using the helm install command. For example:

`helm install my-release ajuin/<chart-name>`

Replace <chart-name> with the name of the chart you wish to install.

## Updating the Repository
To ensure you have the latest version of the charts, update your local Helm chart repository cache:

`helm repo update`

## Searching for Charts
You can search for charts in the Ajuin repository using the helm search command:

`helm search repo ajuin`

# Creating Your Own Chart
For basic chart creation, you can use the `createchart.sh` script. This script will create a chart with default configurations and prompt you for the chart name and the image you want to use. If the image uses a non-standard port, you might need to adjust the `service.port` setting in the `values.yaml` file.

# Warning
Please note that all charts in this repository are maintained by a single individual and may be subject to experimental changes. There may be occasional issues or instability, so proceed with caution.

# Contributing
We welcome contributions to the Ajuin Helm Chart Repository! If you have a chart you'd like to add or improvements to an existing chart, please submit a pull request.

# Contact
For any questions or issues, feel free to reach out via GitHub Issues.
