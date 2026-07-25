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
