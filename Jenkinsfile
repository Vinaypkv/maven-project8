pipeline {
    agent {
        node {
            label 'java17'
        }
    
    }

    options {
                timestamps()
                buildDiscarder(logRotator(numToKeepStr: '2', artifactNumToKeepStr: '2'))
                timeout(time: 240, unit: 'MINUTES')
                disableConcurrentBuilds()
                }

        stages {

            stage ('AppCodeCheckout') {
                steps {

                    git 'https://github.com/Vinaypkv/vinay-devopsLab-maven1.git'

                }
            }
            stage ('CI Build') {

                steps {
                    
                        sh 'ls -l'
                        
                        sh 'pwd'
                        sh 'mvn clean package'

                    

                     }
    
            }

             stage ('Docker Build && Push && DEPLOY ') {
               

                steps {
                    
                    withCredentials([string(credentialsId: 'DOCKERPWD', variable: 'DOCKER_PWD')]) {
    


                    sh 'docker build . -t vinaypkvp/app43:test'
                    sh 'docker login -u vinaypkvp -p ${DOCKER_PWD}'
                    sh 'docker push vinaypkvp/app43:test'
                    sh 'docker run -p 94:8080 -d vinaypkvp/app43:test'
                    
                }

                }
             }

            stage('Archive and clean workspace') {
                steps {
                    
                    archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
                    cleanWs()
                }

            }
    }
}
