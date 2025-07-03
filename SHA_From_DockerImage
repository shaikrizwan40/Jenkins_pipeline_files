pipeline {
    agent{ label "EC2"}
    environment { Git_Password= credentials("GitHub")}
    stages{
        stage("Git Checkout"){
            steps{
                cleanWs()
                sh "git clone https://github.com/shaikrizwan40/EKS_Cluster_Project.git"
                sh "echo $Git_Password > secret.txt"
                
                script{
                def imageName = "nginx"
                def tag = "1.25"
                sh "docker pull ${imageName}:${tag}"
                def sha = sh(script: "docker inspect --format='{{index .RepoDigests 0}}' ${imageName}:${tag}", returnStdout: true).trim()
                sh "echo Image SHA: ${sha} > variable.txt"
          
                }
            }
        }
    }
}
    
