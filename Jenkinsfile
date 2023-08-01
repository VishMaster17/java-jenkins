pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/VishMaster17/java-jenkins']])
                    bat 'mvn clean install'
                }

            }
        stage('Build Docker image') {
            steps {
                script {
                    bat 'docker build -t vishmaster/java-jenkins .'
                }
            }
        }
        stage('Push Docker image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker-pass', variable: 'dockerpassword')]) {
                        bat "docker login -u vishmaster17 -p ${dockerpassword}"
                        bat 'docker push vishmaster17/java-jenkins'
                    }
                }
            }
        }
    }
}