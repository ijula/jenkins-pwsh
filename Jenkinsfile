pipeline {
    agent {
        label "windows-dev"
    }
    stages {
        stage ('stage1') {
            steps {
                pwsh ".\\test1.ps1 ${params.in_disks} ${params.in_servername}"
            }
        }
    }
}
