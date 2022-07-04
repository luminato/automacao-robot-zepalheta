pipeline {
    agent {
        docker {
            image 'python'
        }
    }

    stages {
        stage('build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Api tests'){
            steps{
                sh 'robot -d ./logs tests/api'
            }
        }
    }
}