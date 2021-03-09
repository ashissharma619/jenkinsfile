pipeline {
    environment {
        MSYS_NO_PATHCONV= "1"
        echo 'text here' >> ../deleteme.txt
        git commit -am "[ci skip] Skip build"
    }    
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}
