pipeline {
        agent {
  label 'centos7_Slave'
        } 

    stages {
        stage('Checkout Code') {
            steps {
                cleanWs()
                
                
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/giladifrah/sample-nodejs.git']]])
            }
        }
        stage('Build') {
            steps {
                sh 'docker build . -t nodeapp'
               
            }
        }
        stage('Test') {
            steps {
                sh 'docker run nodeapp'
                sh 'sleep 20'
                sh 'docker ps -l'
                sh 'curl 127.0.0.1:3000'
   
            }
        }
        stage('Package') {
            steps {
                sh "tar -czvf package-${BUILD_ID}.tar.gz *"
                archive '*.tar.gz'
            }
        }
    }
    post {
        always {
             chuckNorris()  
              
            }
           }

}
