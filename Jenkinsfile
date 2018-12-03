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
                zip zipFile: 'function' + $env.BUILD_ID + '.zip', archive: false
                archiveArtifacts artifacts: 'function' + $env.BUILD_ID + '.zip', fingerprint: true
            }
        }
         stage('branch-name') {
            steps {
                sh 'echo $env.BRANCH_NAME'
            }
        }
    }
}