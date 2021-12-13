pipeline {
 environment {
 registry = “neisenbe/dhcp”
 registryCredential = ‘dockerhub’
 dockerImage = ‘’
 }
 agent any
 stages {
 stage(‘Cloning Git’) {
 steps {
 git ‘ssh://git@gitlab.com:nicolas.feith/projet_docker_systemes_avances.git’
 }
 }
 stage(‘Building Docker Image’) {
 steps{
 script {
 dockerImage = docker.build registry + “:$BUILD_NUMBER”
 }
 }
 }
 stage(‘Push Image to Docker Hub ‘) {
 steps{
 script {
 docker.withRegistry( ‘’, registryCredential ) {
 dockerImage.push()
 dockerImage.push(‘latest’)
 }}
 }}
 }
}