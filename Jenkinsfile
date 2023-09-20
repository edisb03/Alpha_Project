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
                    def dockerSocket = 'npipe:////./pipe/docker_engine'
                    
                    Dockerfile(dockerSocket) {
                        echo "Building Docker Image"
                        // Use Windows-style paths and PowerShell syntax
                        powershell """
                            docker build -t Dockerfile .
                        """
                    }
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

    // post {
    //     always {
    //         script {
    //             step(
    //                 [
    //                     $class: 'RobotPublisher',
    //                     outputPath: 'output',
    //                     outputFileName: '**/output.xml',
    //                     reportFileName: '**/report.html',
    //                     logFileName: '**/log.html',
    //                     disableArchiveOutput: false,
    //                     passThreshold: 100,
    //                     unstableThreshold: 75,
    //                     otherFiles: "**/*.png,**/*.jpg",
    //                 ]
    //             )
    //         }
    //     }
    // }
}




















// pipeline {
//     agent any // This will run the pipeline on any available agent

//     options {
//         disableConcurrentBuilds()
//         skipStagesAfterUnstable()
//     }

//     parameters {
//         choice(name: 'BROWSER', choices: ["headlesschrome", "chrome"], description: 'The browser to run the tests with')
//         choice(name: 'ENVIRONMENT', choices: ["prod"], description: 'The environment to run the Testcases')
//         choice(name: 'LANGUAGE', choices: ["English"])

//     }

//     stages {
//         stage('builddocker') {
//             // when {
//             //     anyOf {
//             //         changeset "Dockerfile"
//             //         changeset "python_requirements.txt"
//             //     }
//             // }
//             steps {
//                 // echo "Building Docker"
//                 // withCredentials([usernamePassword(credentialsId: 'nexus-docker-imbus', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                 //     script {
//                 //         docker.withRegistry("${dockerRegistry}", "${USERNAME}", "${PASSWORD}") {
//                 //             docker.build("${image}:${version}", ".").push()
//                 //         }
//                 //     }
//                 // }
//                 script{
//                     """
//                     docker build -t  .  --file Dockerfile
//                     """
//                 }
//             }
//         } 
//         stage('codecheck'){
//             steps{
//                 script{
//                     """
//                     docker run robot --outputdir /workdir/output/dryrun --dryrun /workdir/TestCases
//                     """
//                 }
//             }
//         }


//         // stage('docs') {
//         //     steps {
//         //         script {
//         //             echo 'Creating keyword docs'
//         //             def robotImage = "${dockerRegistry}/${image}:${version}"
//         //             def command = """
//         //                 docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${robotImage} bash -c "libtoc --output_dir workdir/output/docs workdir/Resources"
//         //             """
//         //             sh command
//         //             publishHTML(target: [
//         //                 allowMissing: false,
//         //                 alwaysLinkToLastBuild: false,
//         //                 keepAll: true,
//         //                 reportDir: 'output/docs',
//         //                 reportFiles: '**/*.html',
//         //                 reportName: 'Keywords docs'
//         //             ])
//         //         }
//         //     }
//         // }

//         // stage('smoketest') {
//         //     when { expression { params.SKIP_SMOKE_TEST != true } }
//         //     steps {
//         //         script {
//         //             echo 'Running smoke tests'
//         //             def robotImage = "${dockerRegistry}/${image}:${version}"
//         //             def command = """
//         //                 docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${robotImage} bash -c "robot --include smokeORSMOKEORSmoke --exclude ${EXCLUDE_TAGS} --skip ${SKIP_TAGS} -v BROWSER:${BROWSER} -v ENV:${ENVIRONMENT} -v COUNTRY:${COUNTRY} -v LANGUAGE:${LANGUAGE} --loglevel ${LOG_LEVEL} --outputdir workdir/output/quicktest workdir/TestCases"
//         //             """
//         //             sh command
//         //         }
//         //     }
//         // }

//         // stage('testrun') {
//         //     when {
//         //         allOf {
//         //             expression { params.INCLUDE_TAGS != 'smokeORSMOKEORSmoke' }
//         //             not { triggeredBy "SCMTrigger" }
//         //         }
//         //     }
//         //     steps {
//         //         script {
//         //             echo 'Running tests'
//         //             def robotImage = "${dockerRegistry}/${image}:${version}"
//         //             def command = """
//         //                 docker run --pull=always --user "$(id -u):$(id -g)" -v /etc/passwd:/etc/passwd:ro --rm -v $WORKSPACE:/workdir ${robotImage} bash -c "robot --include ${INCLUDE_TAGS} --exclude ${EXCLUDE_TAGS} --skip ${SKIP_TAGS} -v BROWSER:${BROWSER} -v ENV:${ENVIRONMENT} -v COUNTRY:\\"${COUNTRY}\\" -v LANGUAGE:${LANGUAGE} --loglevel ${LOG_LEVEL} --outputdir workdir/output/testrun workdir/TestCases"
//         //             """
//         //             sh command
//         //         }
//         //     }
//         // }
//     }

//     post {
//         always {
//             script {
//                 step(
//                     [
//                         $class: 'RobotPublisher',
//                         outputPath: 'output',
//                         outputFileName: '**/output.xml',
//                         reportFileName: '**/report.html',
//                         logFileName: '**/log.html',
//                         disableArchiveOutput: false,
//                         passThreshold: 100,
//                         unstableThreshold: 75,
//                         otherFiles: "**/*.png,**/*.jpg",
//                     ]
//                 )
//             }
//         }

//         // failure {
//         //     emailext(
//         //         subject: "Build failed in Jenkins: " + "${env.JOB_NAME}".split("/").join(" » ") + " #${env.BUILD_ID}",
//         //         body: "<p>See <<a href='${env.BUILD_URL}'>${env.BUILD_URL}</a>></p>",
//         //         attachLog: true,
//         //         recipientProviders: [culprits(), requestor()]
//         //     )
//         // }
//     }

//     // cleanup {
//     //     cleanWs(
//     //         cleanWhenNotBuilt: false,
//     //         deleteDirs: true,
//     //         disableDeferredWipeout: true,
//     //         notFailBuild: true,
//     //         patterns: [
//     //             [pattern: '.gitignore', type: 'INCLUDE']
//     //         ]
//     //     )
//     // }
// }