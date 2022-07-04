pipeline {
    agent {
        docker {
            image 'python'
            args '--network=zepalheta-network'
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
                robot archiveDirName: 'robot-plugin', outputPath: 'logs', overwriteXAxisLabel: ''
            }
        }
    }
}