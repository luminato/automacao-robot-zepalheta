pipeline {
    agent {
        docker {
            image 'qaninja/python-wd'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Api Tests'){
            steps{
                sh 'robot -d ./logs/api tests/api'
                
            }
        }
        stage('Web Tests'){
            steps{
                sh 'robot -d ./logs/web -v browser:headless tests/web'
            }
        }
    
    }

    post {
        always {
            robot archiveDirName: 'robot-plugin', disableArchiveOutput: true, logFileName: '**/log.htm', otherFiles: '**/*.png,**/*.jpg', outputFileName: '**/output.xml', outputPath: 'logs', overwriteXAxisLabel: '', reportFileName: '**/report.xml'
            chuckNorris()
        }
    }
}