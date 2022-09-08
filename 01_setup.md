# SETUP
### Disclaimer:
- Please read the documentation for each subject
- This documentation will be very summarised and expects you to go deeper
- Please help us make the documentation better

## What are we building?
- We are building [this](https://filedn.eu/lJEPcSQWQQPRsWJKijxnXCQ/ortelius/gitops/01-ci-dev-ortelius-cloudnative-architecture-poc.html)

## Windows
- `Windows 10` latest version & fully updated
- Enable `WSL2` | Go to `Programs and features` --> `Turn Windows features on or off` --> `Windows Subsystem for Linux`
- I recommend using a second disk if you have one in your machine to create the custom folder to house the VMDK
- This splits up the I/O between the Windows OS and WSL2 which is just a stripped down virtual machine
- Install Windows Terminal [here](https://docs.microsoft.com/en-us/windows/terminal/install) for easier management and get familiar with the documentation
- Use this [documentation](https://www.windowscentral.com/how-install-ubuntu-2110-wsl-windows-10-and-11) to install the latest Ubuntu flavour, dont' bother with the Microsoft store

## Linux
- Checkout the latest version of [Ubuntu](https://ubuntu.com/) or [CentOS](https://www.centos.org/)

## MacOs
### Package Managers
- [Macports.org](https://www.macports.org/)
- [Brew.sh](https://brew.sh/)

## Jargon
- Blast radius
- Containers
- Continous Integration
- Continous Delivery
- Event driven
- GitOps
- Helm
- Markdown
- Microservices
- PODs
- Opensource

## Useful resources
### Devdocs | The online command encyclopedia & yes you can access it offline
- [devdocs.io](https://devdocs.io/)
- Bash, CSS, Docker, Flask, Git, Go, Brew, HTML, HTTP, Java, JavaScript, Markdown, Nginx, Nodejs, npm, Python, Kubectl, Kubernetes
### SDKMan | For managing all things Java | SDKs | JDKs
- [sdkman.io](https://sdkman.io/)

# Choose between Docker or Podman
- [Read this article to gain a holistic understanding of PodMan vs Docker](https://www.lambdatest.com/blog/podman-vs-docker/)

## [Git](https://git-scm.com/)
- Install Git for all things source control
- Get familiar with the basic commands
- Use Devdocs and the documentation on the site

## [Docker](https://www.docker.com/)
- [Account setup](https://hub.docker.com/signup)
- [Install](https://docs.docker.com/get-docker/)
- Get familiar with the basic commands
- Use Devdocs and the documentation on the site

## [Podman](https://podman.io/)
- [Podman-Desktop](https://podman-desktop.io/)
- Get familiar with the basic commands
- Checkout the documentation on the site

## Container Registries
- Think of container registries as huge parking lots for containers
- [AWS registry](https://gallery.ecr.aws/)
- [Docker registry](https://hub.docker.com/_/registry)
- [GCP registry](https://cloud.google.com/container-registry)
- [Azure registry](https://azure.microsoft.com/en-us/products/container-registry/)
- [RedHat Quay registry](https://quay.io/)

## [Kind](https://kind.sigs.k8s.io/)
- Kind allows you to use Docker to run K8s nodes as containers
- Install [here](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- Get familiar with the basic commands
- Checkout the documentation on the site

## [Kubernetes](https://kubernetes.io/)
- K8s is a production grade container orchestrater
- K8s is the conductor of the orchestra where the conductor is K8s and the orchestra is the containers within PODs
- PODS are cuddly safe worlds to hold containers (so cute)
- Install Kubectl the command line tool [here](https://kubernetes.io/docs/tasks/tools/)
- Get familar with the basic commands
- Use Devdocs and the documentation on the site

## [Keptn](https://keptn.sh/)
- Cloud native application life-cycle orchestration
- API & event driven
- Install [here](https://keptn.sh/docs/quickstart/)

## [Helm](https://helm.sh/)
- Install Helm for your operating system (Scroll down until you see `Get Helm!`)

## [ArgoCD](https://argo-cd.readthedocs.io/en/stable/#:~:text=Argo%20CD%20is%20implemented%20as,target%20state%20is%20considered%20OutOfSync%20.)
- Argo CD is a declarative, GitOps continous delivery tool for Kubernetes
- For example it allows you to abstract the application configuration out of the developer code

## [Ortelius](https://ortelius.io/)
-