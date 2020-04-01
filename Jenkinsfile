pipeline {
    agent any

    stages {
        stage('setup') {
            steps {
                sh 'make setup'
            }
        }
        stage('Build') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
