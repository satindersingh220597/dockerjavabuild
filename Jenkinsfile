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

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                docker run -d \
                --name $CONTAINER_NAME \
                -p 8081:8080 \
                $IMAGE_NAME
                '''
            }
        }
    }
}
