pipeline {
    agent {
        label "windows-dev"
    }
    stages {
        stage ('stage1') {
            steps {
                echo "Hello!"
                pwsh "git status"
                pwsh "git branch --list -a"
                //pwsh ".\\test1.ps1 '${params.in_disks}' '${params.in_servername}'"
            }
        }
    }
}
