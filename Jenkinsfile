pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        skipStagesAfterUnstable()
    }

    // parameters {
    //     choice(name: 'BROWSER', choices: ["headlesschrome", "chrome"], description: 'The browser to run the tests with')
    //     choice(name: 'ENVIRONMENT', choices: ["prod"], description: 'The environment to run the Testcases')
    //     choice(name: 'LANGUAGE', choices: ["English"])
    // }
    parameters {

        choice(name: 'BROWSER', choices:["headlesschrome", "chrome", "firefox"], description: 'The browser to run the tests with')
        choice(name: 'ENVIRONMENT', choices:["prod"], description: 'The environment to run the Testcases')
        choice(name: 'LANGUAGE', choices:["English"], description: 'Country language')
        booleanParam(name: 'SKIP_SMOKE_TEST', defaultValue: true, description: 'Allows to skip the quicktest stage if necessary (not recommended)')
        string(name: 'INCLUDE_TAGS', defaultValue: params.INCLUDE_TAGS, description: "Only tests with these tags are executed. Leave empty to run all tests. Doesn't affect the dryrun - it checks all tests anyway.")
        string(name: 'EXCLUDE_TAGS', defaultValue: 'brokenORDoNotExecute', description: 'Tests with these tags are NOT executed and NOT included in report')
        string(name: 'SKIP_TAGS', defaultValue: 'bug*ORBUG*ORBug*', description: 'Tests with these tags are NOT executed, yet they are displayed in report - with status SKIP')
        choice(name: 'LOG_LEVEL', choices:["Info", "Debug", "Trace"], description: 'Robot Framework log level. Higher levels (Debug, Trace) give you the more verbose output, but slower the execution.')

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
stage('testrun'){
    steps{
        powershell """
            docker run --rm -v ${WORKSPACE}:/workdir alpha bash -c "robot --outputdir /workdir/output/testrun --include ${INCLUDE_TAGS}  --exclude ${EXCLUDE_TAGS}  /workdir/TestCases"
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
