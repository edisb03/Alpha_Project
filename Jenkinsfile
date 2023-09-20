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
   
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in your workspace
                    // Replace 'my-app-image' with a suitable image name
                    script {
    echo "Workspace directory: ${WORKSPACE}"
}

                     powershell '''
            # Run the Docker command to get the version
            docker --version
            docker build -t alpha . 
        '''

                }
            }
        }
   stage('codecheck') {
    steps {
        powershell """
            # Define variables
            \$robotImage = 'Dockerfile:latest'  # Use the image name you built
            \$workspaceDir = '\${WORKSPACE}'  # Note the escape character before \$

            # Run Robot Framework dry-run
            docker run --rm -v \$workspaceDir:/workdir \$robotImage robot --outputdir /workdir/output/dryrun --dryrun /workdir/TestCases
        """
    }
}


    }
}
