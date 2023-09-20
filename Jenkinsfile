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
        stage('Preparation') {
            steps {
                deleteDir() // Clean the workspace
            }
        }

        stage('builddocker') {
            steps {
                script {
                    // Set the Docker socket for Windows
                        powershell """
                            docker build  .
                        """
                    }
                }
            }

        stage('codecheck') {
            steps {
                script {
                    echo "Running Robot Framework Tests"
                    def robotImage = "Dockerfile:latest"  // Use the image name you built
                    // Use Windows-style paths and PowerShell syntax
                    powershell """
                        docker run --rm -v ${WORKSPACE}:/workdir ${robotImage} robot --outputdir /workdir/output/dryrun --dryrun /workdir/TestCases
                    """
                }
            }
        }
    }

}