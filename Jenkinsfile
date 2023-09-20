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

      post {
        	// publish RF reports after each build
            always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'output',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 100,
			              unstableThreshold   : 75,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
                    if (currentBuild.result == 'FAILURE') {
                        robot { rerunFailedTests(output: 'output') }
                    }
		        }                
	  		}
            failure {
                emailext(
                    subject: "Build failed in Jenkins: " + "${env.JOB_NAME}".split("/").join(" » ") + " #${env.BUILD_ID}",
                    body: "<p>See <<a href='${env.BUILD_URL}'>${env.BUILD_URL}</a>></p>",
                    attachLog: true,
                    recipientProviders: [culprits(), requestor()]
                )
            }    
        // clean workspace after build
        cleanup {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
            }
        }
}
