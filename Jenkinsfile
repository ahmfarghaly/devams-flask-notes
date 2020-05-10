pipeline {
    environment {
        registry = "asfora/notes-webapp"
        registryCredential = 'dockerhub'
        versionName = "blue"
        dockerImage = ''
    }

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
                    dockerImage = docker.build registry + ":$versionName"
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
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry"+ ":$versionName"
            }
        }
        /**
        stage('set current kubectl context') {
            steps{
                sh 'kubectl config use-context '
            }
        }
        stage('Deploy blue container') {
            when {
                expression { env.BRANCH_NAME == 'blue' }
            }
            steps{
                sh 'kubectl apply -f ./blue-controller.json'
            }
        }
        stage('Deploy green container') {
            when {
                expression { env.BRANCH_NAME == 'green' }
            }
            steps{
                sh 'kubectl apply -f ./green-controller.json'
            }
        }
        stage('Create Blue-Green service') {
            when {
                expression { env.BRANCH_NAME != 'master' }
            }
            steps{
                sh 'kubectl apply -f ./blue-green-service.json'
            }
        }
        */   
    }
}
