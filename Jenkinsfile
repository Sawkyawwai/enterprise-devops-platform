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

        stage('Archive Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    archiveArtifacts artifacts: 'tfplan', fingerprint: true
                }
            }
        }

        stage('Manual Approval') {
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    input(
                        message: 'Apply Terraform changes to AWS?',
                        ok: 'Deploy'
                    )
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Terraform Output') {
            steps {
                dir("${TF_DIR}") {
                    sh '''
                        echo "===== Terraform Outputs ====="
                        terraform output
                    '''
                }
            }
        }

        stage('Update Ansible Inventory') {
            steps {
                dir("${TF_DIR}") {

                    script {

                        def publicIp = sh(
                            script: "terraform output -raw instance_public_ip",
                            returnStdout: true
                            ).trim()

                            echo "Public IP: ${publicIp}"

                        sh """
                            sed -i 's/^web1 ansible_host=.*/web1 ansible_host=${publicIp}/' \
                            /home/saw/Lab-project-1/enterprise-devops-platform/ansible/inventories/dev/hosts
                            """

                        sh '''
                            echo "===== Updated Inventory ====="
                            cat /home/saw/Lab-project-1/enterprise-devops-platform/ansible/inventories/dev/hosts
                            '''
            }
        }
    }
}

    }

    post {

        success {
            echo 'Terraform CD Pipeline completed successfully.'
        }

        failure {
            echo 'Terraform CD Pipeline failed.'
        }
    }

}