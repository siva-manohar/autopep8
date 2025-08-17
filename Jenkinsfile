pipeline {
    agent any
    stages {
        stage('build'){
            steps {
                sh '''
                whoami
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 888576196681.dkr.ecr.us-east-1.amazonaws.com
                docker build -t kubernetes-project .
                docker tag kubernetes-project:latest 888576196681.dkr.ecr.us-east-1.amazonaws.com/kubernetes-project:${BUILD_NUMBER}
                docker push 888576196681.dkr.ecr.us-east-1.amazonaws.com/kubernetes-project:${BUILD_NUMBER}
                '''
            }
        }
        stage('deploy'){
            steps{
                sh '''
                sed "s/tag/${BUILD_NUMBER}/g" deployment-mahesh.yaml > deployment-mahesh-new.yaml
                kubectl apply -f deployment-mahesh-new.yaml
                kubectl apply -f service-dileep.yaml
                '''
            }
        }
    }
}
