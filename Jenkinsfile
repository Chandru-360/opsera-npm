pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
            }
        }
       stage('Publish') {
            steps {
                withCredentials([string(credentialsId: 'jenkins', variable: '897b41466da6e701cafe8f5e36555488769cc237')]) {
                    sh('git push https://${GIT_AUTHOR_NAME}:${GIT_PASSWORD}@simple-node-js-react-npm-app.git  --tags -f --no-verify')
                }
            }
        }
    }
   
}