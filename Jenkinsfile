pipeline {
    agent any

    stages {
        stage('Lint') {
            steps {
                echo 'Linting..'
                steps {
                    sh 'tidy -q -e *.html'
                    sh 'pylint --disable=R,C,W1203,W1202 app.py'
                }
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
