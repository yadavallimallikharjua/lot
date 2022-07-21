pipeline {
    agent any
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
                sh 'docker image build -t myimage:1.0 .'
            }
        }
    }
}
