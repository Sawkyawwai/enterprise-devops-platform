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
