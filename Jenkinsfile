pipeline {
    agent any
    tools {
        maven 'mvn3.9'
    }
    stages {
        stage('Git Checkout') {
            steps{
                git branch: 'main', credentialsId: 'gitlab_pat', url: 'https://github.com/udodi05/docker_local.git'
            }
        }
        stage('Maven Build') {
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Docker Build & Push') {
            steps{
                sh 'docker build -t kniru/tomcat:latest .'
                withCredentials([usernamePassword(credentialsId: 'docker_hub_cred', passwordVariable: 'DH_TOKEN', usernameVariable: 'DH_USER')]) {
                  sh 'echo $DH_TOKEN | docker login -u $DH_USER --password-stdin'
                  sh 'docker push kniru/tomcat:latest'
                }
            }
        }
        stage('Deploy') {
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'ec2Host', keyFileVariable: 'EC_KEY', usernameVariable: 'EC_USER')]) {
                    sh 'ssh -i $EC_KEY -o StrictHostKeyChecking=no $EC_USER@15.223.213.46 "docker pull kniru/tomcat:latest & docker run -d -p 8080:8080 --name acada-web kniru/tomcat:latest"'
                }
            }
        }
    }
}