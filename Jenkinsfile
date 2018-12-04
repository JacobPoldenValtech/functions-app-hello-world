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
                        azureCLI commands: [[exportVariablesString: '', script: 'az group create -n MyResourceGroup --location northeurope'], [exportVariablesString: '/publicIpAddress|PUBLIC_IP', script: 'az vm create -n ${VM_NAME} -g MyResourceGroup --image UbuntuLTS --data-disk-sizes-gb 10 20']], principalCredentialId: '<credential_id>'
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