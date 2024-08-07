# Helm Chart Configuration

This Helm chart deploys your application. Below are the configurable parameters for this chart and their default values as defined in the `values.yaml` file.

## Parameters

### image

| Option | Description |
|--------|-------------|
| `image.repository` | Defines which image to use. |
| `image.pullPolicy` | Specifies the image pull policy. Options: `IfNotPresent`, `Always`, `Never`. |
| `image.tag` | Defines the version to use, e.g., `v1.0.1`. |

For more information, visit: [Kubernetes Image Documentation](https://kubernetes.io/docs/concepts/containers/images/).

### ingress

To configure Ingress for the application, modify the following parameters:

| Option | Description |
|--------|-------------|
| `ingress.enabled` | Specifies whether to enable Ingress. Default: `false`. |
| `ingress.className` | Define what ingress to use e.g. nginx, cilium, ... |
| `ingress.annotations` | Annotations for the Ingress resource. Default: `{}`. |
| `ingress.hosts` | List of hostnames for which the Ingress should route traffic. Default: `[]`. |
| `ingress.tls.secretName` | Define the secretName of the secret deployed by e.g. cert-manager |
| `ingress.tls.hosts` | List the hostnames which can use the tls secret |

For more information, visit: [Kubernetes Ingress Documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/).

### service

To configure a `ClusterIP` service for the application, modify the following parameters:

| Option | Description |
|--------|-------------|
| `service.type` | Specifies the type of the service. Set to `ClusterIP` for internal-only access. Default: `ClusterIP`. |
| `service.port` | Defines the port that the service will expose. Default: `80`. |
| `service.targetPort` | The port on the container that the service should forward traffic to. Default: `80`. |
| `service.clusterIP` | Specify a static IP address for the service. If not specified, a random IP is assigned. Default: `""`. |
| `service.selector` | Define the labels used to select the pods that the service should route traffic to. Default: `{}`. |

For more information, visit: [Kubernetes Service Documentation](https://kubernetes.io/docs/concepts/services-networking/service/).

### volumes

To configure volumes for the application, modify the following parameters:

| Option | Description |
|--------|-------------|
| `volumes` | List of volumes to attach to the pod. Each volume can have different sources such as ConfigMaps, Secrets, PersistentVolumeClaims, etc. Default: `[]`. |

For more information, visit: [Kubernetes Volumes Documentation](https://kubernetes.io/docs/concepts/storage/volumes/).

### volumesMounts

To configure volumesMounts for the application, modify the following parameters:

| Option | Description |
|--------|-------------|
| `volumesMounts` | List of volume mounts to attach to the container. Each volume mount specifies where a volume should be mounted inside the container. Default: [].|

For more information, visit: [Kubernetes Volumes Documentation](https://kubernetes.io/docs/concepts/storage/volumes/).

### env

| Option | Description |
|--------|-------------|
| `env.TZ` | Define the pods timezone e.g. "Europe/Paris" |


