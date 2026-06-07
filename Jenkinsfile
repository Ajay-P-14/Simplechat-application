pipeline {

    agent any

    stages {

        stage('Checkout Stage') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Ajay-P-14/Simplechat-application.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nodejs-app:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker stop nodejs-app || true
                    docker rm nodejs-app || true

                    docker run -d \
                    --name nodejs-app \
                    -p 9090:8000 \
                    nodejs-app:${BUILD_NUMBER}
                '''
            }
        }
    }
}