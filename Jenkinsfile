pipeline {
        agent {
  label 'centos7_Slave'
} 

    stages {
        stage('Checkout Code') {
            steps {
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'giladgit-ssh', url: 'git@github.com:giladifrah/sample-nodejs.git']]])
            }
        }
        stage('Build') {
            steps {
                sh ''' export APP=DEVELOP;  
                    npm install;
                    ls;
                    echo $APP; '''
               
            }
        }
        stage('Test') {
            steps {
                sh 'nohup node index.js &'
                sh 'curl 192.168.1.18:3000 &'
                sh 'sleep 60'
   
            }
        }
        stage('Package') {
            steps {
                sh "tar -czvf package-${BUILD_ID}.tar.gz *"
                archive '*.tar.gz'
            }
        }
    }
}
