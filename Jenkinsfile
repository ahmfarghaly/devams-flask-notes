environment {
    registry = "asfora/notes-webapp"
    registryCredential = 'dockerhub'
    dockerImage = ''
}

pipeline {
    agent any

    stages {
        stage('setup') {
            steps {
                sh 'make setup'
            }
        }
        stage('install') {
            steps {
                sh 'make install'
            }
        }
        stage('lint') {
            steps {
                sh 'make lint'
            }
        }
        stage('test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('build-docker') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('deploy-dockerhub') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }   
                }
            }
        }
    }
}
