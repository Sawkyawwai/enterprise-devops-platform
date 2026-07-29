# Module 5.3 – Deploy Docker Image to Kubernetes

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
