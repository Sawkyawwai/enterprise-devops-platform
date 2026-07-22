# Jenkins CI Pipeline

## Overview

This module implements a Jenkins Declarative Pipeline to automate the Terraform Continuous Integration (CI) workflow. The pipeline validates Infrastructure as Code (IaC) before any infrastructure changes are deployed to AWS.

The pipeline automatically checks out the latest source code from GitHub, generates the required Terraform variable file, validates the Terraform configuration, creates an execution plan, archives the generated plan, and cleans the Jenkins workspace after the build.

---

## Pipeline Workflow

```text
GitHub Repository
        │
        ▼
Checkout Source
        │
        ▼
Generate terraform.auto.tfvars
        │
        ▼
Terraform Init
        │
        ▼
Terraform Format
        │
        ▼
Terraform Validate
        │
        ▼
Terraform Plan
        │
        ▼
Archive tfplan
        │
        ▼
Clean Workspace
```

---

## Pipeline Stages

### 1. Checkout Source

Downloads the latest source code from the GitHub repository using the configured SSH credential.

---

### 2. Generate terraform.auto.tfvars

Automatically generates the Terraform variable file during the build.

This approach prevents sensitive or environment-specific values from being stored in the Git repository.

Example variables:

- VPC CIDR
- Public Subnet CIDR
- Availability Zone
- AMI ID
- EC2 Instance Type
- SSH Public Key

---

### 3. Terraform Init

Initializes the Terraform working directory by:

- Downloading required providers
- Initializing Terraform modules
- Preparing the backend

---

### 4. Terraform Format

Ensures all Terraform files follow the official Terraform formatting standard.

Commands:

```bash
terraform fmt -recursive
terraform fmt -check -recursive
```

---

### 5. Terraform Validate

Performs static validation of the Terraform configuration.

Checks include:

- Terraform syntax
- Variable references
- Resource configuration
- Module configuration

No AWS resources are created during this stage.

---

### 6. Terraform Plan

Creates an execution plan showing the infrastructure changes that Terraform will perform.

The generated plan is saved as:

```text
tfplan
```

No infrastructure changes are applied during this stage.

---

### 7. Archive Terraform Plan

Archives the generated `tfplan` file as a Jenkins build artifact.

Benefits:

- Review planned changes
- Reuse the approved execution plan
- Support deployment in later pipeline stages

---

### 8. Workspace Cleanup

Removes the Jenkins workspace after every build to ensure each pipeline execution starts from a clean environment.

---

## Project Structure

```text
jenkins/
│
├── Jenkinsfile
└── README.md
```

---

## Technologies Used

- Jenkins
- Declarative Pipeline
- GitHub
- Terraform
- AWS
- SSH Authentication

---

## Lessons Learned

During the implementation of this module, several issues were identified and resolved.

### Missing terraform.tfvars

The original pipeline expected `terraform.tfvars` to exist in the repository.

Since the file was excluded by `.gitignore`, Terraform prompted for required variables.

**Solution**

Generate `terraform.auto.tfvars` dynamically during every pipeline execution.

---

### Terraform Format Failure

The generated variable file was not initially formatted according to Terraform standards.

**Solution**

Run:

```bash
terraform fmt terraform.auto.tfvars
```

before executing the format validation stage.

---

### Workspace Cleanup Issue

The pipeline originally cleaned the workspace before archiving the Terraform execution plan.

As a result, Jenkins could not find the `tfplan` artifact.

**Solution**

Move artifact archiving into its own stage before workspace cleanup.

Pipeline order:

```text
Terraform Plan
      │
      ▼
Archive tfplan
      │
      ▼
Clean Workspace
```

---

## Current Status

✅ GitHub Integration

✅ SSH Authentication

✅ Terraform CI Pipeline

✅ Terraform Validation

✅ Terraform Plan Generation

✅ Artifact Archiving

✅ Automatic Workspace Cleanup

---

## Next Module

Module 3.6 extends this pipeline by adding:

- Manual Approval
- Terraform Apply
- Terraform Output
- Infrastructure Deployment (CD)
