# Fine dining with Abraham Ortelius
## Canapes
## Operating Systems
### Windows
- `Windows 10` latest version & fully updated
- Enable `WSL2` | Go to `Programs and features` --> `Turn Windows features on or off` --> `Windows Subsystem for Linux`
- We recommend using a second disk if you have one in your machine to create the custom folder to house the VMDK
- This splits up the I/O between the Windows OS and WSL2 which is just a stripped down virtual machine
- Install Windows Terminal [here](https://docs.microsoft.com/en-us/windows/terminal/install) for easier management and get familiar with the documentation
- Use this [documentation](https://www.windowscentral.com/how-install-ubuntu-2110-wsl-windows-10-and-11) to install the latest `Ubuntu` flavour, don't bother with the Microsoft store ( We recommend `Ubuntu Jammy JellyFish` at this time of writing)
- Line feed ending hell can be solved with [Dos2Unix](https://www.computerhope.com/unix/dos2unix.htm)
- Windows uses CRLF
- Linux uses LF
- This [Stackoverflow article](https://stackoverflow.com/questions/2920416/configure-bin-shm-bad-interpreter) can help you understand whats going on
- Example error `/bin/sh^M:bad interpreter`
- VSCode extension to fix this headache [here](https://marketplace.visualstudio.com/items?itemName=vs-publisher-1448185.keyoti-changeallendoflinesequence)
- Suggestion Alert: Set your `VSCode` to `LF` and only use `WSL2` to do all your work

## Configs for WSL
#### Windows Operating System
`c:\Users\Ortelius\.wslconfig`
```
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=4GB

# Sets the VM to use two virtual processors
processors=2

# Specify a custom Linux kernel to use with your installed distros.
# The default kernel used can be found at https://github.com/microsoft/WSL2-Linux-Kernel
#kernel=C:\\temp\\myCustomKernel

# Sets additional kernel parameters, in this case enabling older Linux base images such as Centos 6
#kernelCommandLine = vsyscall=emulate

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=4GB

# Sets swapfile path location, default is %USERPROFILE%\AppData\Local\Temp\swap.vhdx
swapfile=D:\\wsl\\ubuntu-22-04-lts\\wsl-swap.vhdx

# Disable page reporting so WSL retains all allocated memory claimed from Windows and releases none back when free
pageReporting=false

# Turn off default connection to bind WSL 2 localhost to Windows localhost
localhostforwarding=true

# Disables nested virtualization
nestedVirtualization=false

# Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
debugConsole=true
[user]
default = sacha

[automount]
options = "metadata"

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=4GB

```
#### WSL Ubuntu Jammy JellyFish Linux Virtual Machine
`\etc\wsl.conf`
```
# Automatically mount Windows drive when the distribution is launched
[automount]

# Set to true will automount fixed drives (C:/ or D:/) with DrvFs under the root directory set above. Set to false means drives won't be mounted automatically, but need to be mounted manually or with fstab.
enabled = true

# Sets the directory where fixed drives will be automatically mounted. This example changes the mount location, so your C-drive would be /c, rather than the default /mnt/c.
root = /

# DrvFs-specific options can be specified.
options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"

# Sets the `/etc/fstab` file to be processed when a WSL distribution is launched.
mountFsTab = true

# Network host settings that enable the DNS server used by WSL 2. This example changes the hostname, sets generateHosts to false, preventing WSL from the default behavior of auto-generating /etc/hosts, and sets generateResolvConf to false, preventing WSL from auto-generating /etc/resolv.conf, so that you can create your own (ie. nameserver 1.1.1.1).
[network]
hostname = DemoHost497686

generateHosts = false
generateResolvConf = false

# Set whether WSL supports interop process like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding $PATH environment variables.
[interop]
enabled = false
appendWindowsPath = false

# Set the user when launching a distribution with WSL.
[user]
default = DemoUser

# Set a command to run when a new WSL instance launches. This example starts the Docker container service.
[boot]
command = service docker start

```

## Linux
- Checkout the latest version of [Ubuntu](https://ubuntu.com/) or [CentOS](https://www.centos.org/)

## MacOs
### Package Managers
- [Macports.org](https://www.macports.org/)
- [Brew.sh](https://brew.sh/)

# Starters
### [Topgrade | Update everything with one command](https://github.com/r-darwish/topgrade) `Optional`
- [Topgrade Wiki](https://github.com/r-darwish/topgrade/wiki/Step-list)
- Support all operating systems
- Topgrade config file is here `.config/topgrade.toml`
- All I need to type now on my [`zsh terminal`](https://ohmyz.sh/) is `topgrade`
- It upgrades all my package managers including the packages, Mac store apps and Mac OS updates
- It can do so much more | We will leave you to explore

### [Devdocs.io | The application command encyclopedia & yes you can access it offline](https://devdocs.io/)
- `Bash, CSS, Docker, Flask, Git, Go, Brew, HTML, HTTP, Java, JavaScript, Markdown, Nginx, Nodejs, npm, Python, Kubectl, Kubernetes`
- And so much more

### [SDKMan.io | For managing all things Java | SDKs | JDKs](https://sdkman.io/) `Optional`
- Usage [here](https://sdkman.io/usage)

### [Discord.com](https://discord.com/)
- Discord is global human interaction
- Set yourself up with your very own `Discord server`
- Create a dedicated channel for for `Git Guardian alerts`
- `Do this before Git Guardian`

### [Git Guardian.com](https://www.gitguardian.com/)
- Set yourself up for free
- This tool will warn you when you accidently put sensitive information on the public internet in your repos
- Go to `VCS Integrations` and add your `GitHub` (You will need to set yourself up on [GitHub](https://github.com) first)
- Go to `Alerting` and setup `Discord` notifications
- Support for `CI|CD` pipelines such as `Azure, Bitbucket, Circle CI, Drone CI, GitHub Actions, GitLab, Jenkins & Travis`
- Support for `Git Hooks`
- Support for `Docker` | [Docker image integration](https://docs.gitguardian.com/internal-repositories-monitoring/integrations/docker/docker_image)
- Alerting for `Discord, Custom Webhook, Jira, Pager Duty, Slack, Splunk`

### [YADM.io](https://yadm.io/) Yet Another Dot File Manager `Optional`
- In Linux you end up with a lot of config files which usually start with `.`
- The dot files have configurations for various application packages installed on your machine
- YADM allows you to keep the dot files of your choice backed up to a repository
- Documentation [here](https://github.com/TheLocehiliosan/yadm/blob/master/yadm.md)

# Main Course
### Choose between Docker or Podman
- [Read this article to gain a holistic understanding of PodMan vs Docker](https://www.lambdatest.com/blog/podman-vs-docker/)

### [Git-scm.com](https://git-scm.com/)
- Install Git for all things source control
- Get familiar with the basic commands such as pushing and pulling of changes and creating branches
- Please refer to the [Ortelius PR Cheat Sheet](https://docs.ortelius.io/guides/contributorguide/pull-request-cheat-sheet/)
- Use [Devdocs](https://devdocs.io/) and the Git documentation [here](https://git-scm.com/doc)

`.gitconfig` inspiration
```
[core]
	excludesfile = /Users/abraham/.gitignore_global
[alias]
# Make sure you're adding under the [alias] block.
# Git Commit, Add all and Push — in one step.
# Using functions in Git
cap = "!f() { git add .; git commit -m \"$@\"; git push; }; f"
# NEW.
new = "!f() { git cap \"📦 NEW: $@\"; }; f"
# IMPROVE.
imp = "!f() { git cap \"👌 IMPROVE: $@\"; }; f"
# FIX.
fix = "!f() { git cap \"🐛 FIX: $@\"; }; f"
# RELEASE.
rlz = "!f() { git cap \"🚀 RELEASE: $@\"; }; f"
# DOC.
doc = "!f() { git cap \"📖 DOC: $@\"; }; f"
# TEST.
tst = "!f() { git cap \"🤖 TEST: $@\"; }; f"
# BREAKING CHANGE.
brk = "!f() { git cap \"‼️ BREAKING: $@\"; }; f"
[user "https://github.com"]
	name = Abraham Ortelius
	email = abraham.ortelius@ortelius.io
[core]
	repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = false
[init]
  defaultBranch = main
	templatedir = /Users/abraham/.git_template
[pull]
	rebase = false
[credential "https://github.com"]
	helper = store
[credential "https://gist.github.com"]
	helper = store
[help]
	autocorrect = 1
[advice]
	addIgnoredFile = false
[user]
	name = Abraham Ortelius
	email = abraham.ortelius@ortelious.io

[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[web]
	browser = firefox

```

### Source Control [GitHub.com](https://github.com/)
- Set yourself up on GitHub
- Set up Git [here](https://docs.github.com/en/get-started/quickstart/set-up-git)

### [VSCode](https://code.visualstudio.com/) IDE
- Download the `VSCode IDE` [here](https://code.visualstudio.com/download)
- Security starts in the IDE

**Extensions**
- Install `Snyk Security | Code & Open Source Dependencies` scanner [here](https://marketplace.visualstudio.com/items?itemName=snyk-security.snyk-vulnerability-scanner)
- Install `Language Support for Java by Red Hat` [here](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- Install `Yaml` support [here](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- Install `Indent Rainbow` [here](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- Install `Change All End of Line Sequence` [here](https://marketplace.visualstudio.com/items?itemName=vs-publisher-1448185.keyoti-changeallendoflinesequence)

### [Docker.com](https://www.docker.com/)
- [Account setup](https://hub.docker.com/signup)
- [Install](https://docs.docker.com/get-docker/)
- Get familiar with the basic commands
- Use [Devdocs](https://devdocs.io/) and the Docker documentation [here](https://docs.docker.com/)

**Docker Security**
- Bake security right in from the word go
- We are going to use Snyk to scan our containers
- Snyk is free and you can set yourself up [here](https://snyk.io/)
- In `Docker Desktop` go to the ` Extensions Marketplace` and install the `Snyk Container Extension`
- On your command line you can now scan your Docker images with `docker scan your-docker-image`
- Disclaimer: Please follow any prompts `Snyk` requires you to fulfill to get up and running

### [Podman.io](https://podman.io/)
- [Podman-Desktop](https://podman-desktop.io/)
- Get familiar with the basic commands
- Checkout the Podman documentation [here](https://docs.podman.io/en/latest/)

### Container Registries
- Think of container registries as huge parking lots for containers
- Container images can be pushed and pulled from these locations
- [AWS registry](https://gallery.ecr.aws/)
- [Docker registry](https://hub.docker.com/_/registry)
- [GCP registry](https://cloud.google.com/container-registry)
- [Azure registry](https://azure.microsoft.com/en-us/products/container-registry/)
- [RedHat Quay registry](https://quay.io/) Ortelius uses Quay

### [Kind.sigs.k8s.io](https://kind.sigs.k8s.io/)
- Kind allows you to use Docker to run K8s nodes as containers
- Install [here](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- Get familiar with the basic commands
- Checkout the Kind documentation [here](https://kind.sigs.k8s.io/docs/user/quick-start/)

### [Kubernetes.io](https://kubernetes.io/)
- K8s is a production grade container orchestrater
- K8s is the conductor of the orchestra where the conductor is K8s and the orchestra is the containers within PODs
- PODS are cuddly safe worlds to hold containers (so cute)
- Install `kubectl` the command line tool [here](https://kubernetes.io/docs/tasks/tools/)
- Get familar with the basic commands
- Use [Devdocs](https://devdocs.io/) and the official documentation [here](https://kubernetes.io/docs/home/)
- Use the `kubectl` cheat sheet [here](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- Add the `aliases` & `auto complete` which are in the `cheat sheet`

### [PostgreSQL.org](https://www.postgresql.org/)
- Open Source relational database

# Dessert
### [Keptn.sh](https://keptn.sh/)
- Cloud native application life-cycle orchestration
- API & event driven
- Install [here](https://keptn.sh/docs/quickstart/)

### [Helm.sh](https://helm.sh/)
- Install Helm for your operating system (Scroll down until you see `Get Helm!`)
- K8s templating engine

### [Argo-CD.readthedocs.io](https://argo-cd.readthedocs.io/en/stable/#:~:text=Argo%20CD%20is%20implemented%20as,target%20state%20is%20considered%20OutOfSync%20.)
- Argo CD is a declarative, GitOps continous delivery tool for Kubernetes
- For example it allows you to abstract the application configuration out of the developer code
- Install [here](https://argo-cd.readthedocs.io/en/stable/getting_started/)

### [Ortelius.io](https://ortelius.io/)
- Documentation [here](https://docs.ortelius.io/guides/)
- User guide [here](https://docs.ortelius.io/guides/userguide/)
- Contributors guide [here](https://docs.ortelius.io/guides/contributorguide/)
- Installation & Support [here](https://docs.ortelius.io/guides/userguide/installation-and-support/)
- On-prem installation [here](On-Prem Installation)