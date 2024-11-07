pipeline {
    agent any

    tools {
        maven 'MAVEN3'
    }

    environment {
        DOCKER_USERNAME = 'haneefmhmmd' // Manually set your Docker Hub username
        DOCKER_IMAGE = 'haneefmhmmd/hello-world-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Step to check out the code from the repository
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                // Step to build the Maven project
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                // Docker login using Jenkins credentials for password
                withCredentials([string(credentialsId: 'CredentialID_DockerHubPWD', variable: 'DOCKER_PASSWORD')]) {
                    sh """
                    echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin
                    """
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image
                sh "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }

        stage('Docker Push') {
            steps {
                // Push Docker image to Docker Hub
                sh "docker push ${DOCKER_IMAGE}:latest"
            }
        }
    }
}
