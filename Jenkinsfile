pipeline {
    agent { node }
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
        stage('push') {
            steps {
                sh 'echo push'            }
        }
    }
}