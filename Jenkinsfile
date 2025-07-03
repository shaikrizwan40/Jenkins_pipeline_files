pipeline {
    agent any
    environment { Git_Password= credentials("GitHub_Credentials")}
    stages{
        stage("Git Checkout"){
            steps{
                cleanWs()
                sh "git clone https://github.com/shaikrizwan40/EKS_Cluster_Project.git"
              
            }}}}
         
