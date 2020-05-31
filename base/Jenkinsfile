pipeline {
  agent {
    node {
      label 'base'
    }

  }
  stages {
    stage('build and tag image') {
      steps {
        container('base') {
          sh '''docker build -t kubespheredev/builder-base .
docker tag kubespheredev/builder-base kubespheredev/builder-base:2.1.0'''
        }

      }
    }
    stage('docker push') {
      when{
        branch 'master'
      }
      steps {
        container('base') {
          withCredentials([usernamePassword(passwordVariable : 'DOCKER_PASSWORD' ,usernameVariable : 'DOCKER_USERNAME' ,credentialsId : 'dockerhub-id' ,)]) {
            sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
          }
            sh 'docker push kubespheredev/builder-base'
        }
      }
    }
    stage('update language image'){
      when{
        branch 'master'
      }
      steps{
         build job:'../builder-maven/master', wait: false
         build job:'../builder-nodejs/master', wait: false
         build job:'../builder-go/master', wait: false
      }
    }
  }
}
