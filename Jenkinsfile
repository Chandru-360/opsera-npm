podTemplate(
  label: 'zenbuild', 
  inheritFrom: 'default',
  containers: [
    containerTemplate(name: 'node-builder', image: 'node:12-alpine', command: 'cat', ttyEnabled: true)
  ])
{
  node ('zenbuild') {
    stage ('Checkout') {
      checkout scm
    }

    stage('Build') {
      container('node-builder') {
        steps {
          sh 'npm install'
        }
      }
    }
  }
}
