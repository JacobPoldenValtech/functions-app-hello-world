pipeline {
    agent any
    environment {
        HOME = '.'
        PATH='/usr/bin/env'
    }
    stages {
        stage('Auth') {
            steps {
                withCredentials([azureServicePrincipal('scratchlogin')]) {
                        sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                }
        }
        }
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
          stage('Example') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('zip') {
            steps {
                zip zipFile: "function${env.BUILD_ID}.zip", archive: false
                archiveArtifacts artifacts: "function${env.BUILD_ID}.zip", fingerprint: true
            }
        }
        stage('provision') {
            steps {
                sh "scripts/provision-function.sh"
            }
        }
    }
}