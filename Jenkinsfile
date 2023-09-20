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
            docker run --rm -v ${WORKSPACE}:/workdir alpha bash -c "robot --outputdir /workdir/output/dryrun --dryrun /workdir/TestCases"
        """
    }
}



    }
}
