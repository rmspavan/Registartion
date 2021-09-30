pipeline {
    agent any
    tools {
      maven 'M2_HOME'
          } 
    stages {
        stage('scm') {
            steps {
                git branch: 'master', credentialsId: 'git', url: 'https://github.com/rmspavan/Registartion.git'
            }
        }
   	    stage ('Clean and Install')  {
	      steps {
                 sh "mvn clean install"
              }
        }
    	stage ('Build')  {
	      steps {
                   sh "mvn package"
              }
         }
        stage('Deploy') {
            steps {
                sshagent(['sshkey']){
                    sh "scp -o StrictHostKeyChecking=no webapp/target/register.war root@192.168.1.245:/usr/share/tomcat/webapps/"
                  }
                }
            }       
        }
    }