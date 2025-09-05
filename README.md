# Golang dev sandbox 

Has config for both Vagrant and Github devcontainer.

## Github Devcontainer

Creating a devcontainer with this project will automatically use the included ./devcontainer/Dockerfile as the machin base, and install the required Golang plugin. You can debug immediately.

Note that the Dockerimage is compiled each time you spin up a new devcontainer instance.

## Local Visual Studio Code

### Setup visual studio code to debug in vagrant

install local VS Code plugins

- Remote SSH

### Debug in VSCode

- ctrl-shift P to bring up command dropdown
- Click "Remote-ssh > Connect to host"
- Enter vagrant@<guest VP IP>
- Select "linux" as OS type if prompted
- enter "vagrant" as password
- You should now be connected to the machine, but not your vagrant directory. Click "Open folder" in remote explorer.
- Select "/vagrant" in remote list
- Enter password again.
- Open a Go file, go to VSCode debug menu, Click on "Run and debug" button. You should be promoted with "You don't have an extension for debugging Go, should we find a go extension in the marketplace". Select yes, this will install an extension on your remote VM, not locally. It will try to install "Go", click on "install in ssh:<IP>".
- Create "launch.json", set the content to 

        {
            "version": "0.2.0",
            "configurations": [
                {
                    "name": "Launch Package",
                    "type": "go",
                    "request": "launch",
                    "mode": "auto",
                    "program": "${workspaceFolder}/src/your-go-file.go",
                    "env": {
                        "GOPATH" : "/home/vagrant/go"
                    }
                }
            ]
        }
        
- Add a breakpoint and hit play, you should be debugging now.