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
                sh 'mkdir archive'
                sh 'echo test > archive/test.txt'
                zip zipFile: 'test.zip', archive: false, dir: 'archive'
                archiveArtifacts artifacts: 'test.zip', fingerprint: true
            }
        }
         stage('branch-name') {
            steps {
                sh 'echo $env.BRANCH_NAME'
            }
        }
    }
}