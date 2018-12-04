pipeline {
    agent {docker { image 'node:8.14-alpine' }}
    environment {
        HOME = '.;/usr/local/bin'
        PATH='/usr/bin/env;/usr/local/bin'
    }
    stages {
        stage('Auth') {
            steps {
                withCredentials([azureServicePrincipal('scratchlogin')]) {
                        azureCLI commands: [[script: 'az login --service-principal -u "$AZURE_CLIENT_ID" -p "$AZURE_CLIENT_SECRET" -t "$AZURE_TENANT_ID"']], principalCredentialId: '"$AZURE_CLIENT_ID"'

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