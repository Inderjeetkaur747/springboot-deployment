pipeline {
    agent any
    tools{
        maven 'Maven'
    }
     stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Inderjeetkaur747/springboot-deployment']])
                sh 'mvn clean package'
            }
}
 stage('Build docker image') {
            steps {
               script {
                 sh 'docker build -t inderjeetkaur/springboot-docker.jar .'               }
            }

}
 stage('Push image to Dockerhub') {
            steps {
               script {
                  withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'dockerhubpassword')]) {
                  // some block
                     sh "docker login -u inderjeetkaur -p ${dockerhubpassword}"
}

                    sh 'docker push inderjeetkaur/springboot-docker.jar'
            }

            }

        }

    }

}