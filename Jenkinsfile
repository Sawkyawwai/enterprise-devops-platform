pipeline {

    agent any

    options {
        timestamps()
        ansiColor('xterm')
    }

    environment {
        TF_DIR = "terraform/environments/dev"
    }

    stages {

        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Generate terraform.tfvars') {
            steps {
                dir("${TF_DIR}") {
                    writeFile file: 'terraform.tfvars', text: '''
vpc_cidr           = "10.10.0.0/16"
environment        = "dev"
public_subnet_cidr = "10.10.1.0/24"
availability_zone  = "ap-southeast-1a"

ami_id             = "ami-0ed6a65b84536f6ce"
instance_type      = "t2.micro"

aws_region         = "ap-southeast-1"

public_key_path    = "/home/saw/.ssh/id_ed25519.pub"
'''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform fmt -check -recursive'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

    }

    post {
        success {
            dir("${TF_DIR}") {
                archiveArtifacts artifacts: 'tfplan', fingerprint: true
            }
        }
    }
}
