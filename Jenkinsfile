pipeline {
    agent any
    tools {
      maven 'M2_HOME'
          } 
    stages {
        stage('scm') {
            steps {
                git branch: 'main', credentialsId: 'git', 
                url: 'https://github.com/rmspavan/Registartion.git'
            }
        }
        stage('build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['sshkey']){
                    sh "scp -o StrictHostKeyChecking=no webapp/target/register.war 
                    root@192.168.1.245:/usr/share/tomcat/webapps"
                  }
                }
            }       
        }
    }