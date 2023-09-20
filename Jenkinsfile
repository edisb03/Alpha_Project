pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        skipStagesAfterUnstable()
    }

    parameters {
        choice(name: 'BROWSER', choices: ["headlesschrome", "chrome"], description: 'The browser to run the tests with')
        choice(name: 'ENVIRONMENT', choices: ["prod"], description: 'The environment to run the Testcases')
        choice(name: 'LANGUAGE', choices: ["English"])
    }

    stages {
        // stage('Preparation') {
        //     steps {
        //         script {
        //             // Clean the workspace
        //             deleteDir()
        //         }
        //     }
        // }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in your workspace
                    // Replace 'my-app-image' with a suitable image name
                    sh 'docker --version'
                }
            }
        }

        // stage('Run Docker Container') {
        //     steps {
        //         script {
        //             // Run a Docker container based on the built image
        //             // You can pass environment variables and other options as needed
        //             // Replace 'my-app-container' with a suitable container name
        //             sh 'docker run --name my-app-container -d my-app-image'
        //         }
        //     }
        // }

        // stage('Execute Tests in Docker Container') {
        //     steps {
        //         script {
        //             // Example: Run tests inside the Docker container
        //             // Replace 'my-app-container' and the test command with your specific commands
        //             sh 'docker exec my-app-container your_test_command_here'
        //         }
        //     }
        // }

        // stage('Cleanup') {
        //     steps {
        //         script {
        //             // Stop and remove the Docker container
        //             sh 'docker stop my-app-container'
        //             sh 'docker rm my-app-container'

        //             // Optionally, remove the Docker image
        //             sh 'docker rmi my-app-image'
        //         }
        //     }
        // }
    }
}
