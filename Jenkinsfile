pipeline 
{
    agent {
        // define the machines the test should be executed in
        label 'docker'
    }
    options {
        disableConcurrentBuilds()
        skipStagesAfterUnstable()        
    }
    parameters {

        choice(name: 'BROWSER', choices:["headlesschrome", "chrome", "firefox"], description: 'The browser to run the tests with')
        choice(name: 'ENVIRONMENT', choices:["uat", "dev", "stg", "prod"], description: 'The environment to run the Testcases')
        choice(name: 'COUNTRY', choices:["United States"], description: 'Select country')
        choice(name: 'LANGUAGE', choices:["English"], description: 'Country language')
        booleanParam(name: 'SKIP_SMOKE_TEST', defaultValue: true, description: 'Allows to skip the quicktest stage if necessary (not recommended)')
        string(name: 'INCLUDE_TAGS', defaultValue: params.INCLUDE_TAGS, description: "Only tests with these tags are executed. Leave empty to run all tests. Doesn't affect the dryrun - it checks all tests anyway.")
        string(name: 'EXCLUDE_TAGS', defaultValue: 'brokenORDoNotExecute', description: 'Tests with these tags are NOT executed and NOT included in report')
        string(name: 'SKIP_TAGS', defaultValue: 'bug*ORBUG*ORBug*', description: 'Tests with these tags are NOT executed, yet they are displayed in report - with status SKIP')
        choice(name: 'LOG_LEVEL', choices:["Info", "Debug", "Trace"], description: 'Robot Framework log level. Higher levels (Debug, Trace) give you the more verbose output, but slower the execution.')

    }
    environment {
        // Define variables here
        registryCredentialsId = "nexus-docker-dgsp"
        dockerRegistry = "nexus.kiongroup.net"
        image = "dgsp-test_automation"
        version = "1.1.0"
    }
    stages {        
         stage('builddocker')
         {
             when {
                 anyOf {
                     changeset "Dockerfile"
                     changeset "python_requirements.txt"
                     }
                 }
             steps {
                 echo "building docker"                 
                 withCredentials([usernamePassword(credentialsId: 'nexus-docker-dgsp', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')])  {
                 sh """#!/bin/bash
                     docker login ${dockerRegistry} -u ${USERNAME} -p ${PASSWORD}
                     docker build -t ${dockerRegistry}/${image}:${version} .
                     docker push ${dockerRegistry}/${image}:${version}
                     docker rmi ${dockerRegistry}/${image}:${version}
                 """
                 }
             }
         }
        stage('codecheck') 
        {
        steps {
            sh '''
                    docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${dockerRegistry}/${image}:${version} bash -c "robot --dryrun --exclude ${EXCLUDE_TAGS} --skip ${SKIP_TAGS} --loglevel ${LOG_LEVEL} --outputdir workdir/output/dryrun workdir"
                    docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${dockerRegistry}/${image}:${version} bash -c "robocop --argumentfile workdir/.robocop --reports rules_by_id,rules_by_error_type workdir"
                 '''
             }
        }
        stage('docs') 
        {
            steps {        
                sh '''                    
                    echo 'Creating keyword docs...'
                    docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${dockerRegistry}/${image}:${version} bash -c "libtoc --output_dir workdir/output/docs workdir/Resources"                    
                '''
                publishHTML(target:
                    [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'output/docs',
                        reportFiles: '**/*.html',
                        reportName: 'Keywords docs'
                    ]
                )
            }
        }
        stage('smoketest') 
        {
            when { not { expression { return params.SKIP_SMOKE_TEST} } }
            steps {
                sh '''
                    docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${dockerRegistry}/${image}:${version} bash -c "robot --include smokeORSMOKEORSmoke --exclude ${EXCLUDE_TAGS} --skip ${SKIP_TAGS} -v BROWSER:${BROWSER} -v ENV:${ENVIRONMENT} -v COUNTRY:${COUNTRY} -v LANGUAGE:${LANGUAGE} --loglevel ${LOG_LEVEL} --outputdir workdir/output/quicktest workdir/TestCases"
                '''
            }
        }        
        stage('testrun') 
        {
            when { 
                allOf { 
                    expression { params.INCLUDE_TAGS != 'smokeORSMOKEORSmoke' }
                    not { triggeredBy "SCMTrigger" }
                    }
            }
            steps {
                sh '''
                    docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${dockerRegistry}/${image}:${version} bash -c "robot --include ${INCLUDE_TAGS} --exclude ${EXCLUDE_TAGS} --skip ${SKIP_TAGS} -v BROWSER:${BROWSER} -v ENV:${ENVIRONMENT} -v COUNTRY:\\"${COUNTRY}\\" -v LANGUAGE:${LANGUAGE} --loglevel ${LOG_LEVEL} --outputdir workdir/output/testrun workdir/TestCases"
                '''
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