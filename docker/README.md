# Docker Module

This phase introduces containerization into the Enterprise DevOps Platform.

## Goals

- Install Docker using Ansible.
- Build a custom Nginx Docker image.
- Push the image to Docker Hub.
- Deploy the container automatically using Jenkins.

## Learning Outcomes

- Docker fundamentals
- Image creation
- Container lifecycle
- CI/CD integration with Docker


# Module 4.1 - Install Docker

## Objective

Prepare the EC2 instance for containerized workloads by installing Docker with Ansible.

## Components

- Docker Engine
- Docker Service
- Docker Group

## Files

```
ansible/
├── playbooks/docker.yml
└── roles/docker/
```

## Verification

```bash
docker --version
systemctl status docker
```

Expected:

- Docker installed successfully.
- Docker service is running.
- Ubuntu user added to the docker group.


# Module 4.2 – Deploy Nginx Container

## Objective

Deploy the official Nginx Docker container to the EC2 instance using Ansible.

## Components

- Docker Engine
- Docker SDK for Python
- community.docker collection
- Official nginx image

## Workflow

Terraform
    │
EC2
    │
Docker
    │
Nginx Container

## Verification

```bash
docker ps
```

Expected:

- Nginx container running
- Port 80 published
- Website accessible from browser


# Module 4.3 – Build Custom Docker Image

## Objective

Create a custom Docker image based on the official Nginx image.

## Files

```
docker/
├── Dockerfile
├── index.html
```

## Build

```bash
docker build -t enterprise-devops-web:1.0 docker/
```

## Run

```bash
docker run -d -p 8081:80 enterprise-devops-web:1.0
```

## Verification

Open:

```
http://localhost:8081
```

Expected:

- Custom Enterprise DevOps Platform page is displayed.


# Module 4.4 – Push Image to Docker Hub

## Objective

Publish the custom Docker image to Docker Hub so it can be pulled by any Docker host.

## Commands

Build:

```bash
docker build -t enterprise-devops-web:1.0 .
```

Tag:

```bash
docker tag enterprise-devops-web:1.0 <dockerhub-username>/enterprise-devops-web:1.0
```

Push:

```bash
docker push <dockerhub-username>/enterprise-devops-web:1.0
```

Verify:

```bash
docker pull <dockerhub-username>/enterprise-devops-web:1.0
```

## Outcome

- Custom image stored in Docker Hub.
- Image can be deployed on any Docker host.
