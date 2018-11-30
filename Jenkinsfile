pipeline {
    agent { docker { image 'node:8.11.1' } }
    stages {
        stage('build') {
            steps {
                sh 'npm --version'
            }
        }
    }
}