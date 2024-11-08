pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        RepositoryDockerHub = 'fcongedo'
        NameContainer = "website-desafio"
    }
    stages {
        stage('Build') {
            steps {
                dir('Docker') {
                    sh "docker build -t ${env.RepositoryDockerHub}/${env.NameContainer}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Login to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW')]) {
                    sh "echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        }

        stage('Push image to Dockerhub') {
            steps {
                sh "docker push ${env.RepositoryDockerHub}/${env.NameContainer}:${env.BUILD_NUMBER}"
            }
        }

        stage('Deploy container') {
            steps {
                sh "docker stop ${env.NameContainer} || true"
                sh "docker rm -f ${env.NameContainer} || true"
                sh "docker run -d -p 8082:80 --name ${env.NameContainer} ${env.RepositoryDockerHub}/${env.NameContainer}:${env.BUILD_NUMBER}"
            }
        }

        stage('Test') {
            steps {
                script {
                    sleep(time: 5, unit: 'SECONDS')
                    def curlOutput = sh(script: "curl -s -o /dev/null -w '%{http_code}' http://localhost:8082/", returnStdout: true).trim()
                    echo "curlOutput: ${curlOutput}"

                    if (curlOutput == '200') {
                        currentBuild.result = 'SUCCESS'
                    } else {
                        currentBuild.result = 'FAILURE'
                        error("El código de respuesta no es 200, en su lugar es ${curlOutput}")
                    }
                }
            }
        }

        stage('Docker logout') {
            steps {
                sh "docker logout"
            }
        }
    }
}
