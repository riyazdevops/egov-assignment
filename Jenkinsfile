pipeline {
  environment {
    imagename = "22786/egov"
    registryCredential = 'jenkins-dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/riyazdevops/egov.git', branch: 'master', credentialsId: 'riyaz-jekins-git'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dir('/egov/node-jenkins') {
            dockerImage = docker.build imagename
        }
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
   }
}