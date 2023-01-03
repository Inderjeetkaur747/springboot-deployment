pipeline {
    agent any
    tools{
        maven 'Default'
    }
    stages{
        stage('Build Maven'){
            steps{
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Inderjeetkaur747/springboot-deployment']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t springboot-docker/springboot-docker.jar .'
                }
            }
        }
         stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}