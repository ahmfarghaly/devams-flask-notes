pipeline {
    environment {
        registry = "asfora/notes-webapp"
        registryCredential = 'dockerhub'
        versionName = "green"
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
        stage('set current kubectl context') {
            steps{
                withAWS(region:'us-west-2',credentials:'awsdev') {
                    sh 'aws eks --region us-west-2 update-kubeconfig --name DevamsK8sCluster'
                    sh 'kubectl config use-context arn:aws:eks:us-west-2:736637672331:cluster/DevamsK8sCluster'
                }
            }
        }
        stage('Deploy blue container') {
            when {
                expression { env.BRANCH_NAME == 'blue' }
            }
            steps{
                withAWS(region:'us-west-2',credentials:'awsdev') {
                    sh 'kubectl apply -f ./blue-controller.json'
                }
            }
        }
        stage('Deploy green container') {
            when {
                expression { env.BRANCH_NAME == 'green' }
            }
            steps{
                withAWS(region:'us-west-2',credentials:'awsdev') {
                    sh 'kubectl apply -f ./green-controller.json'
                }
            }
        }
        stage('Create Blue-Green service') {
            when {
                expression { env.BRANCH_NAME != 'master' }
            }
            steps{
                withAWS(region:'us-west-2',credentials:'awsdev') {
                    sh 'kubectl apply -f ./blue-green-service.json'
                    sh 'kubectl describe service bluegreenlb'
                }
            }
        }  
    }
}
