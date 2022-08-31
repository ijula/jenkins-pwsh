pipeline {
    agent {
        label "windows-dev"
    }
    stages {
        stage ('stage1') {
            steps {
                echo "${params.in_disks}"
                echo "${params.in_servername}"
                pwsh ".\\test1.ps1 ${params.in_disks} ${params.in_servername}"
            }
        }
    }
}
