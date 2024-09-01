# Welcome
Welcome to the Ajuin Helm Chart Repository! This repository contains a collection of Helm charts for deploying various applications on Kubernetes.

# Adding the Ajuin Repository
To add the Ajuin repository to your Helm client, use the following command:

`helm repo add ajuin https://reinoudb.github.io/charts/`

# Usage
Once you've added the repository, you can use the helm install command to deploy charts from the Ajuin repository. For example:

`helm install my-release ajuin/<chart-name>`
Replace <chart-name> with the name of the chart you wish to install.

Updating the Repository
To ensure you have the latest version of the charts, you can update your local Helm chart repository cache:

`helm repo update`
Searching for Charts
You can search for charts in the Ajuin repository using the helm search command:

`helm search repo ajuin`

# Warning
All of the charts in this repo are just maintained by me and i tend to like to do some testing on them. So prepare for something to brake.

# Contributing
We welcome contributions to the Ajuin Helm Chart Repository! If you have a chart you'd like to add or improvements to an existing chart, please submit a pull request.
