#!groovy

node {
    currentBuild.result = "SUCCESS"
    try {
        stage('Checkout') {
            checkout scm
       }

        stage('build') {
            print "Build"
        }

        stage('test') {
            env.NODE_ENV = "test"
            print "Environment will be : ${env.NODE_ENV}"
            def docker_local = docker.image('fedora:latest');
            docker_local.inside() {
                cat /etc/os-release
            }
            //sh "whoami"
            //sh "docker images"
        }

        stage('Build Image') {
            print "Build image"
        }

        stage('push') {
            echo "Push to Repository"
        }

        stage('cleanup') {
            echo "Cleanup"
        }
    } catch (err) {
        currentBuild.result = "FAILURE"
        //mail body: "Build error: ${env.BUILD_URL}" ,
        //    from: "builder@rauno.com",
        //    replyTo: "developers@rauno.com",
        //    subject: "Build ${env.BUILD_TAG} failed",
        //    to: 'zzzz@yyyyy.com'

        throw err
    }

}
