## Codebuild commands

#### Create a project for this repo in CodeBuild (Once only)

> aws codebuild create-project --cli-input-json file://kubevisor-pgadmin.json

#### Trigger a build of this project

> aws codebuild start-build --project-name kubevisor-pgadmin
