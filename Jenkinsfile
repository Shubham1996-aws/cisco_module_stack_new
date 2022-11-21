pipeline {
    agent any
    parameters {
  choice choices: ['development', 'testing', 'production'], name: 'environment'
  choice choices: ['stack_1', 'stack_2', 'stack_3', 'stack_4'], name: 'target'
}

    stages {
        stage('git_clone') {
            steps {
                git 'https://github.com/Shubham1996-aws/cisco_module_stack_new.git'
            }
        }
        
        stage('terraform_init') {
            steps {
                sh 'terraform -chdir="./resources" init'
                
            }
        }
        
        stage('terraform_plan') {
            steps {
                sh 'terraform -chdir="./resources" plan -var-file="../vars/${environment}.tfvars"'
            }
        }
        
        stage('terraform_apply') {
            steps {
              //  sh 'terraform -chdir="./resources" apply -var-file="../vars/${environment}.tfvars" -target="module.${target}" -auto-approve'
              sh 'terraform -chdir="./resources" apply -var-file="../vars/${environment}.tfvars" -auto-approve'
            }
        }
        
        /*stage('terraform_destroy') {
            steps {
              //  sh 'terraform -chdir="./resources" destroy -var-file="../vars/${environment}.tfvars" -target="module.${target}" -auto-approve'
              sh 'terraform -chdir="./resources" destroy -var-file="../vars/${environment}.tfvars" -auto-approve'
            }
        }*/
    }
}
