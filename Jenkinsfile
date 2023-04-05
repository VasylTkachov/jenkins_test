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
