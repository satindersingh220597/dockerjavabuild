pipeline {
    agent any

    environment {
        IMAGE_NAME = "local-java-app"
        CONTAINER_NAME = "local-java-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/satindersingh220597/dockerjavabuild.git'
            }
        }
         stage('Build Java App (Maven)') {
            steps {
                dir('java-app') {
                    bat 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker stop %CONTAINER_NAME% || exit 0
                docker rm %CONTAINER_NAME% || exit 0
                '''
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                  docker run -d ^
                --name %CONTAINER_NAME% ^
                -p 8081:8080 ^
                %IMAGE_NAME%
                '''
            }
        }
    }
}
