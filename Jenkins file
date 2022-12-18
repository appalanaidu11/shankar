pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-hub', url: 'https://github.com/appalanaidu11/java-maven'
            }
        }
        
        stage('maven Build') {
            steps {
            sh 'mvn clean package'
            }
        }
        
        stage('Tomcat Depoly') {
            steps {
                sshagent(['tomcat-cred']) {
                 sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.41.198:/opt/tomcat9/webapps"
                 sh "ssh ec2-user@172.31.41.198 /opt/tomcat9/bin/shutdown.sh"
                 sh "ssh ec2-user@172.31.41.198 /opt/tomcat9/bin/startup.sh"
                }
            }
        }
    }
}    
