pipeline {

    agent any

    stages {

        stage('Environment Check') {

            steps {

                sh '''
                    echo "=================================="
                    echo " Enterprise DevOps Platform"
                    echo "=================================="

                    echo ""
                    echo "Current User:"
                    whoami

                    echo ""
                    echo "Current Directory:"
                    pwd
                '''
            }
        }

        stage('Check Tools') {

            steps {

                sh '''
                    echo ""
                    echo "Git:"
                    git --version

                    echo ""
                    echo "Terraform:"
                    terraform version

                    echo ""
                    echo "Ansible:"
                    ansible --version

                    echo ""
                    echo "AWS:"
                    aws sts get-caller-identity
                '''
            }
        }

    }

}
