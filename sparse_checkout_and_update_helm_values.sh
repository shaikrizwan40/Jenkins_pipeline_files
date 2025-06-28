pipeline{

agent any
stages{
    stage("Checkout Git Repository"){
        steps{
            cleanWs()
            sh '''
                git clone --filter=blob:none --no-checkout https://github.com/iam-veeramalla/three-tier-architecture-demo.git
                cd three-tier-architecture-demo
                git config --global --add safe.directory `pwd`
                git sparse-checkout init --cone
                git sparse-checkout set EKS/helm
                git reset --hard HEAD
                cd EKS/helm
                sed -i 's/^  repo: .*/  repo: my-custom-repo/' values.yaml
                echo "✅ Moved EKS/helm contents to workspace root"
                '''
}}}}
