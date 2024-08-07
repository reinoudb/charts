# Bento-Next Helm Chart Configuration

This Helm chart deploys the Bento-Next application. Below are the configurable parameters for this chart and their default values as defined in the `values.yaml` file.

## Parameters

### image

| Option | Description |
|--------|-------------|
| `image.repository` | Defines which image to use. |
| `image.pullPolicy` | Specifies the image pull policy. Options: `IfNotPresent`, `Always`, `Never`. |
| `image.tag` | Defines the version to use, e.g., `v1.0.1`. |

For more information, visit: [Kubernetes Image Documentation](https://kubernetes.io/docs/concepts/containers/images/).

### ingress

To configure Ingress for the Bento-Next application, modify the following parameters:

| Option | Description |
|--------|-------------|
| `ingress.enabled` | Specifies whether to enable Ingress. Default: `false`. |
| `ingress.className` | Define what ingress to use e.g. nginx, cilium, ... |
| `ingress.annotations` | Annotations for the Ingress resource. Default: `{}`. |
| `ingress.hosts` | List of hostnames for which the Ingress should route traffic. Default: `[]`. |
| `ingress.tls.secretName` | Define the secretName of the secret deployed by e.g. cert-manager |
| `ingress.tls.hosts` | List the hostnames which can use the tls secret |

Example configuration:

```yaml
ingress:
  enabled: true
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
  hosts:
    - host: example.com
      paths:
        - /
  tls:
    - secretName: example-tls
      hosts:
        - example.com

service
To configure the Service for the Bento-Next application, modify the following parameters:

Option	Description
service.type	Specifies the type of Service. Options: ClusterIP, NodePort, LoadBalancer. Default: ClusterIP.
service.port	The port that the Service will expose. Default: 80.
service.targetPort	The port on the container that the Service should forward traffic to. Default: 80.
service.annotations	Annotations for the Service. Default: {}.
Example configuration:

yaml
Copy code
service:
  type: LoadBalancer
  port: 80
  targetPort: 80
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
volumes
To configure volumes for the Bento-Next application, modify the following parameters:

Option	Description
volumes	List of volumes to attach to the pods. Default: [].
Example configuration:

yaml
Copy code
volumes:
  - name: my-volume
    emptyDir: {}
volumeMounts
To configure volume mounts for the Bento-Next application, modify the following parameters:

Option	Description
volumeMounts	List of volume mounts for the application containers. Default: [].
Example configuration:

yaml
Copy code
volumeMounts:
  - name: my-volume
    mountPath: /data
For more details on how to customize the configuration, refer to the Helm documentation and the Kubernetes API reference.

csharp
Copy code

You can copy and paste this text into your `README.md` file, and adjust
