pipeline {
    agent any
    environment { Git_Password= credentials("GitHub_Credentials")}
    stages{

stage('Check for Non-README Changes') {
      steps {
        script {
          // Get list of changed files in this push
          def changes = sh(script: "git diff --name-only HEAD~1", returnStdout: true).trim()
          echo "Files changed:\n${changes}"

          // If ONLY README.md changed, skip the build
          if (changes == "README.md") {
            echo "🛑 Only README.md changed. Skipping the build."
            currentBuild.result = 'SUCCESS'
            // Exit the pipeline early
            return
          }
        }
      }
    }
        stage("Git Checkout"){
            steps{
                cleanWs()
                sh "git clone https://github.com/shaikrizwan40/EKS_Cluster_Project.git"
              
            }}}}
         
