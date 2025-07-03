pipeline {
    agent any
    environment { Git_Password= credentials("GitHub_Credentials")}
    stages{

    stage('Check for README-only changes') {
      steps {
        script {
          // Get list of changed files
          def changes = sh(script: "git diff --name-only HEAD~1", returnStdout: true).trim()
          echo "🔍 Files changed:\n${changes}"

          // Remove README.md from the list
          def filtered = sh(script: "git diff --name-only HEAD~1 | grep -v '^README.md$' || true", returnStdout: true).trim()

          // If no other file changed → exit pipeline early
          if (filtered == "") {
            echo "🛑 Only README.md changed. Exiting pipeline."
            currentBuild.result = 'SUCCESS'
            // Exit pipeline cleanly with success
            // Using 'return' exits the `script` block and the rest of the pipeline
            return
          }

          echo "✅ Important files changed. Continuing pipeline..."
        }
      }
    }

        stage("Git Checkout"){
            steps{
                cleanWs()
                sh "git clone https://github.com/shaikrizwan40/EKS_Cluster_Project.git"
              
            }}}}
         
