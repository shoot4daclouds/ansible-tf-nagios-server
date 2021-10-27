pipeline{
    agent any

    stages{
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/shoot4daclouds/ansible-tf-nagios-server.git'
            }
        }
        stage('Terraform init'){
            steps{
                sh '''cd terraform/
terraform init'''
            }
        }
        stage('Execute Ansible'){
            environment {
                AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
            }
            steps{
                ansiblePlaybook credentialsId: 'tlappromos-aws-pk', disableHostKeyChecking: true, installation: 'ansible', inventory: 'ansible/inventories/hosts', playbook: 'ansible/nagios-server.yaml', vaultCredentialsId: 'ansible-vault-pass'
            }
        }
    }
}