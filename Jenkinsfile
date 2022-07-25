pipeline {
    agent any
    environment {
        registry = "9492453554/myimage3"
        registryCredential = 'DOCKER_HUB'
        dockerImage = ''
    }
    tools {
        maven 'MVN_version'
    }
    stages {
        stage('scm') {
            steps {
                git branch: 'master', url: 'https://github.com/yadavallimallikharjua/openmrs-core.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package '
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build registry 
                }
            }
        }
        stage('push our image') { 
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy App') {
            steps {
                script {
                kubernetesDeploy(configs: "myimage3.yaml", kubeconfigId: "k8_config")
                }
            }
        }
	}
}
