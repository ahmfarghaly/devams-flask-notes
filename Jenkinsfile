pipeline {
    environment {
        registry = "asfora/notes-webapp"
        registryCredential = 'dockerhub'
        versionName = "latest"
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
                sh "docker rmi $registry" + ":$versionName"
            }
        }   
        /*
        stage('Create Cluster') {
              when {
                expression { env.BRANCH_NAME != 'master' }
              }

              steps {
                milestone(1)
                input 'Create EKS Cluster?'
                milestone(2)
              }
        }
        stage('Create Cluster') {
            steps {
                withAWS(region:'us-west-2',credentials:'aws') {
                    sh 'echo "Create the create cluster "'
                    sh '''
                       eksctl create cluster \
                       --name CapstoneCluster \
                       --region us-west-2 \
                       --nodegroup-name standard-workers \
                       --node-type t3.micro \
                       --node-ami auto \
                       --nodes 2 \
                       --nodes-min 1 \
                       --nodes-max 4
                    '''
                }
            }
        }
        stage('Create a kubectl configuration file') {
            steps{
                withAWS(region:'us-west-2',credentials:'aws') {
                    sh 'echo "Create a kubectl configuration file"'
                    sh 'aws eks --region us-west-2 update-kubeconfig --name CapstoneCluster'
                }
            }
        }
        */
    }
}
