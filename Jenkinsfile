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

                dir('terraform') {
                    sh 'terraform init'
               }

            }

        }
        stage('Terraform Fromat') {
            steps {
                dir('terraform') {
                    sh 'terraform fmt -check -recursive'
              }
           }
        }

        stage('Terraform validate') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
              }
           }
       }
      
        post {
        success {
            archiveArtifacts artifacts: 'terraform/tfplan'
        }
     }
  }

}
