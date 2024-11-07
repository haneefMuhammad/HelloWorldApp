pipeline {
    agent any

    tools {
        maven 'MAVEN3'
    }

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('CredentialID_DockerHubPWD')
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
                // Docker login using credentials stored in Jenkins
                sh "docker login -u haneefmhmmd -p ${DOCKER_HUB_CREDENTIALS}"
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