pipeline {
    environment {
        MSYS_NO_PATHCONV= "1"
    }    
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'text here' >> ../deleteme.txt
                git commit -am "[ci skip] Skip build"
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
