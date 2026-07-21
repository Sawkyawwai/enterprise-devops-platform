pipeline {

    agent any

    stages {

        stage('Checkout Source') {

            steps {
                checkout scm
            }

        }

        stage('Environment Check') {

            steps {

                sh '''
                    echo "Current User:"
                    whoami

                    echo

                    echo "Workspace:"
                    pwd

                    echo

                    echo "Repository Contents:"
                    ls -lah
                '''

            }

        }

    }

}
