pipeline {
    agent {docker { image 'node:8.14-alpine' }}
    environment {
        HOME = '.'
    }
    stages {
        stage('build') {
            steps {
                sh 'npm --version && npm install'
            }
        }
        stage('test') {
            steps {
                sh 'npm test'
            }
        }
        stage('zip') {
            steps {
                sh 'scripts/zip.sh'
            }
        }
         stage('push') {
            steps {
                sh 'scripts/deploy-function.sh'
            }
        }
    }
}