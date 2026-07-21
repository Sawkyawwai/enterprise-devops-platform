pipeline {

    agent any

    options {
        timestamps()
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

        stage('Generate terraform.auto.tfvars') {
            steps {
                dir("${TF_DIR}") {

                    script {
                        writeFile(
                            file: 'terraform.auto.tfvars',
                            text: '''\
vpc_cidr           = "10.10.0.0/16"
public_subnet_cidr = "10.10.1.0/24"
availability_zone  = "ap-southeast-1a"
environment        = "dev"
ami_id             = "ami-0ed6a65b84536f6ce"
instance_type      = "t2.micro"
public_key_path    = "/var/lib/jenkins/.ssh/id_ed25519.pub"
'''.stripIndent()
                        )
                    }

                    sh '''
                        echo "===== terraform.auto.tfvars ====="
                        cat terraform.auto.tfvars

                        terraform fmt terraform.auto.tfvars
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
                    sh '''
                        terraform fmt -recursive
                        terraform fmt -check -recursive
                    '''
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
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            cleanWs()
        }
    }
}
