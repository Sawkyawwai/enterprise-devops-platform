# Module 5.1 – Deploy Docker Image to Kubernetes

## Objective

Deploy the custom Docker image from Docker Hub into a Kubernetes cluster using a Deployment.

## Files

```
kubernetes/
├── namespace.yaml
└── deployment.yaml
```

## Commands

Create namespace:

```bash
kubectl apply -f namespace.yaml
```

Deploy application:

```bash
kubectl apply -f deployment.yaml
```

Verify:

```bash
kubectl get deployments -n enterprise-devops
kubectl get pods -n enterprise-devops
```

## Outcome

- Namespace created.
- Deployment created with 2 replicas.
- Pods running successfully using the custom Docker image.# Module 5.3 – Deploy Docker Image to Kubernetes

## Objective

Deploy the custom Docker image from Docker Hub into a Kubernetes cluster using a Deployment.

## Files

```
kubernetes/
├── namespace.yaml
└── deployment.yaml
```

## Commands

Create namespace:

```bash
kubectl apply -f namespace.yaml
```

Deploy application:

```bash
kubectl apply -f deployment.yaml
```

Verify:

```bash
kubectl get deployments -n enterprise-devops
kubectl get pods -n enterprise-devops
```

## Outcome

- Namespace created.
- Deployment created with 2 replicas.
- Pods running successfully using the custom Docker image.


# Module 5.2 – Expose Application with a Service

## Objective

Expose the Kubernetes Deployment using a NodePort Service.

## Files

```
kubernetes/
├── service.yaml
```

## Commands

Deploy Service

```bash
kubectl apply -f service.yaml
```

Verify

```bash
kubectl get svc -n enterprise-devops
kubectl get endpoints -n enterprise-devops
```

Access Application

```text
http://<Node-IP>:30080
```

## Outcome

- NodePort Service created.
- Service routes traffic to all application Pods.
- Application is accessible from outside the cluster.


# Module 5.3 – Install NGINX Ingress Controller

## Objective

Install the NGINX Ingress Controller to provide a single HTTP entry point for applications running in the Kubernetes cluster.

## Commands

Install the controller:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

Verify the Pods:

```bash
kubectl get pods -n ingress-nginx
```

Verify the Service:

```bash
kubectl get svc -n ingress-nginx
```

Verify the IngressClass:

```bash
kubectl get ingressclass
```

## Outcome

- NGINX Ingress Controller installed.
- `nginx` IngressClass available.
- Cluster ready to create Ingress resources.


# Module 5.4 – Configure Kubernetes Ingress

## Objective

Expose the application using an NGINX Ingress Controller and a hostname instead of accessing the Service directly.

## Files

```
kubernetes/
├── ingress.yaml
```

## Commands

Deploy the Ingress:

```bash
kubectl apply -f ingress.yaml
```

Verify:

```bash
kubectl get ingress -n enterprise-devops
kubectl describe ingress enterprise-devops-ingress -n enterprise-devops
```

## Local Testing

Add an entry to your local hosts file:

```text
<Node-IP> enterprise-devops.local
```

If the Ingress Controller uses a NodePort Service:

```text
http://enterprise-devops.local:<NodePort>
```

## Outcome

- Application exposed through an Ingress resource.
- Host-based routing configured.
- Ready for additional applications and HTTPS in future modules.


# Module 5.5 – Externalize Configuration with ConfigMaps

## Objective

Store website content in a Kubernetes ConfigMap and mount it into the NGINX container.

## Files

```
kubernetes/
├── configmap.yaml
├── deployment.yaml
```

## Commands

Create the ConfigMap:

```bash
kubectl apply -f configmap.yaml
```

Update the Deployment:

```bash
kubectl apply -f deployment.yaml
```

Verify:

```bash
kubectl get configmap -n enterprise-devops
kubectl exec -it <pod-name> -n enterprise-devops -- cat /usr/share/nginx/html/index.html
```

## Outcome

- Website content managed by a ConfigMap.
- Deployment mounts the ConfigMap into the container.
- Configuration can be updated independently of the Docker image.


# Module 5.6 – Manage Sensitive Data with Kubernetes Secrets

## Objective

Store sensitive application configuration in a Kubernetes Secret and inject it into the application as environment variables.

## Files

```
kubernetes/
├── secret.yaml
├── deployment.yaml
```

## Commands

Create the Secret:

```bash
kubectl apply -f secret.yaml
```

Verify:

```bash
kubectl get secret -n enterprise-devops
kubectl describe secret enterprise-devops-secret -n enterprise-devops
```

Verify environment variables:

```bash
kubectl exec -it <pod-name> -n enterprise-devops -- env | grep APP_
```

## Outcome

- Sensitive values stored in a Kubernetes Secret.
- Secret injected into the Pod as environment variables.
- Deployment no longer requires sensitive values to be hardcoded.


# Module 5.7 – Rolling Updates & Rollbacks

## Objective

Upgrade the application to a new container image version with zero downtime and demonstrate rollback capabilities.

## Commands

Update the Deployment:

```bash
kubectl apply -f deployment.yaml
```

Watch the rollout:

```bash
kubectl rollout status deployment/enterprise-devops-web -n enterprise-devops
kubectl get pods -n enterprise-devops -w
```

View rollout history:

```bash
kubectl rollout history deployment/enterprise-devops-web -n enterprise-devops
```

Rollback:

```bash
kubectl rollout undo deployment/enterprise-devops-web -n enterprise-devops
```

Rollback to a specific revision:

```bash
kubectl rollout undo deployment/enterprise-devops-web --to-revision=1 -n enterprise-devops
```

## Outcome

- Built and deployed application version 2.0.
- Performed a zero-downtime rolling update.
- Verified rollout history.
- Successfully rolled back to a previous version.


-----------------------------------------------------------------

# Module 7.1 – Metrics Server

## Objective

Install Metrics Server to collect Kubernetes resource metrics.

## Installation

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## Verification

```bash
kubectl top nodes
kubectl top pods -A
```

## Outcome

- Metrics Server installed.
- CPU and memory metrics available.
- Cluster ready for Prometheus.
