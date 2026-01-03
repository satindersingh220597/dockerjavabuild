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
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                --name $CONTAINER_NAME \
                -p 8081:8080 \
                $IMAGE_NAME
                '''
            }
        }
    }
}
