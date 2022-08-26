pipeline{

    agent any

    tools{
        nodejs 'NodeJS'
    }

     environment{
        build_tag = "build-${BUILD_NUMBER}"
        docker_registry_nodeapp = "ypavankumar123/nodeexpressapp:${build_tag}"
        docker_creds_id = "e9aefd7f-157a-4320-9717-a00a33701190"
    }

    stages{
        stage('Tag Build'){
            steps{
                sh 'git tag ${build_tag}'
              }
            }
        stage('Build Image'){
            steps{
                script{
                        nodeapp = docker.build(docker_registry_nodeapp, "-f ./Dockerfile .")
                    }
                 } 
            }
         stage('Push Image'){
            steps{
                script { 
                    docker.withRegistry('', docker_creds_id ) { 
                        nodeapp.tag(build_tag)
                        nodeapp.push() 
                    }
                 } 
              }
            }
        }
    }

