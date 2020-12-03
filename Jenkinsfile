pipeline {
    agent any
    // options {
    //     timeout(time: 1, unit: 'HOURS') 
    //     skipStagesAfterUnstable()
    //     disableConcurrentBuilds()
    // }
    // environment {
    //     GIT_COMMIT_MESSAGE = "${sh(script:"git log -1 --pretty=format:'%s'", returnStdout: true).trim()}"
    //     GIT_COMMIT_AUTHOR_NAME = "${sh(script:"git log -1 --pretty=format:'%an'", returnStdout: true).trim()}"
    //     JENKINS_USER_ID = "${sh(script: 'id -u', returnStdout: true).trim()}"
    //     JENKINS_GROUP_ID = "${sh(script: 'id -g', returnStdout: true).trim()}"
    // }
    stages {
        // stage('build') {
        //     agent { docker { image 'maven:3.3.3' } }
        //     steps {
        //         sh 'mvn --version'
        //     }
        stage("Using env vars"){
            steps {
                echo "BUILD_NUMBER = ${env.BUILD_NUMBER}"
            }
        }
        // stage('Tests') {
        //     parallel {
        //         stage('Pa11y Tests'){
        //             agent {
        //                 dockerfile {
        //                     dir "${env.WORKSPACE}/aem-cd/stages/pa11y-tests"
        //                     filename "../../dockerfiles/pa11y.Dockerfile"
        //                     additionalBuildArgs "--build-arg DOCKER_HOST_USER_ID=${env.JENKINS_USER_ID} --build-arg DOCKER_HOST_USER_GROUP_ID=${env.JENKINS_GROUP_ID}"
        //                     args "--cap-add=SYS_ADMIN"
        //                     reuseNode true
        //                 }
        //             }
        // //             when { not { environment name: 'SKIP_PA11Y_TEST_STAGE', value: 'true' } }
        //              steps {
        // //                 execFileIfExists './ci/pre-pa11y-tests.sh'
        //                  sh "./aem-cd/stages/pa11y-tests/common/pa11y-tests.sh"
        // //                 execFileIfExists './ci/post-pa11y-tests.sh'
        // //             }
        // //             post {
        // //                 always {
        // //                     archiveArtifacts artifacts: 'pa11y-ci-results/**/*'
        // //                     script { env.PALLY_REPORT = "<${env.BUILD_URL}artifact/pa11y-ci-results/index.html|Pally report> | " }
        // //                 }
        // //             }
        //             }
        //         }
        //     }
        // }
    }
}