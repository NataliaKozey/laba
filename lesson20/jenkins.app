pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/NataliaKozey/last_version.git',
                        credentialsId: 'github-ssh-credentials'
                        ]]
                    ])
            }
        }
        stage('Build') {
            steps {
                script {
                    sh """
                        zip -r latest_crm.zip .
                    """
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withCredentials([sshUserPrivateKey(credentialsId: 'ec2-ssh-key', keyFileVariable: 'SSH_PRIVATE_KEY')]) {
                        sh """
                            ls -l
                            scp -o StrictHostKeyChecking=no  -i \$SSH_PRIVATE_KEY latest_crm.zip ubuntu@$REMOTE_IP:/home/ubuntu/
                            ssh -o StrictHostKeyChecking=no -i \$SSH_PRIVATE_KEY  ubuntu@$REMOTE_IP 'cd /var/www/html && sudo unzip -o /home/ubuntu/latest_crm.zip && sudo chmod -R 755 . && sudo chown -R www-data:www-data . && sudo chmod -R 775 custom modules themes data upload'

                        """
                    }
                }
            }
        }
    }

    post {
        always {
            script{
                sh """
                curl --location 'https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage' --form 'text="The build was completed. \n\nBuild URL: ${env.BUILD_URL}"' --form 'chat_id="253547971"'
                """
            }
        }
    }
}