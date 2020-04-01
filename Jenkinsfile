pipeline {
    agent any

    stages {
        stage('Lint') {
            steps {
                echo 'Linting..'
                sh 'make lint'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
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
