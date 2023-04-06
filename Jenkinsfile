pipeline {
	agent {
	    docker {
            image 'maven:3.6-jdk-11'
        }
	}
	stages {
		stage('Build') {
			steps {
				 checkout([$class:'GitSCM', branches: [[name:'*/main']], userRemoteConfigs:[[url:'https://github.com/VasylTkachov/jenkins_test.git']]])
				 sh 'sudo su'
				 sh 'echo 1234'
				 sh 'apt-get update'
				 sh 'apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release'
				 sh 'curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg'
				 sh 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null'
				 sh 'apt-get update'
				 sh 'apt-get -y install docker-ce-cli'
				 sh 'mvn -B clean install'
				    script {
					    dockerImage = docker.build("vasyltk/jenkins:${env.BUILD_ID}")
					}
				}
			}
		stage('Push') {
	        steps {
			    script {
				    withCredentials([usernamePassword(credentialsId:'dockerhub', usernameVariable:'vasyltk', passwordVariable:'123445666777gfdgfgfg')]){
				        docker.withRegistry('https://registry.hub.docker.com', '12345') {
				            dockerImage.push()
				        }
				    }
				}
			}
		}
	}
}

		// pipeline {
        //     agent any
        //     stages {
        //         stage('Build')
        //          { steps { echo 'Hello, World' } }
        //     }
        //  }
