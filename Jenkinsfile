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
	stage('Input')
       	def userPasswordInput = input (
            id: 'Password',
            message: 'input your password: ',
            ok: 'ok',
            parameters: [string(defaultValue: 'master', description: '.....', name: 'LIB_TEST')]
        )
        echo ("Password was: " + userPasswordInput)
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
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
