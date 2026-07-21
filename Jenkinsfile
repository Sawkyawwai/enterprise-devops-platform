pipeline {

    agent any

    stages {

        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform fmt -check -recursive'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform/environments/dev') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

    }

}
