Setting Up Jenkins with Git, Terraform, and GitHub Integration
This document outlines the steps taken to set up Jenkins with essential tools and plugins for a streamlined CI/CD pipeline.

1. Jenkins Installation and Configuration
Installed Jenkins on the server.
Configured Git and Terraform to work within Jenkins.
2. Docker Configuration
Added Jenkins user to the Docker group:
usermod -aG docker jenkins
This allows Jenkins to manage Docker without requiring root access.

3. Installed Plugins
The following plugins were installed to enhance Jenkins functionality:

Docker Pipeline: To enable Docker container management within pipelines.
GitHub Plugin: For GitHub integration, including webhooks and repository management.
AWS Steps: To interact with AWS resources directly from Jenkins.
SSH Agents: For secure remote server access during pipeline execution.
Pipeline Utility Steps: To manage files and configurations in the pipeline.
4. Adding Credentials
The following credentials were added to Jenkins:

docker-hub-credentials: Docker Hub username and password for pushing/pulling images.
jenkins-ec2-key: AWS EC2 key pair for SSH access.
5. GitHub Webhook Integration
Configured a webhook in GitHub to trigger Jenkins jobs automatically on repository changes (e.g., push events).
Verified successful integration by testing webhook functionality.
6. Creating Jenkins Job
Created a pipeline job in Jenkins to:
Clone the GitHub repository using the configured credentials.
Execute Terraform scripts for infrastructure automation.
Build and push Docker images to Docker Hub using the docker-hub-credentials.
Deploy to AWS using the jenkins-ec2-key.
Also enable the option GitHub hook trigger for GITScm polling in the jenkins job and place the jenkinsfile in the jobs.

7. User needs to update the docker hub username repo name and other gernric field in the JENKINSFILE As of now i have kept it as gerenic

So the above setup will be triggered based on the github webhook commit push it will create an infra with vpc,subnet, security group, loadbalancer.
We are using a simple python hello world script exposed at port 5000. Which we have dockerized at the run time during the Infra creation & deployment.
At the run time using user data it will install the nginx, docker and deploy the image on the server at port 5000. So the application UI can be accessed on the loadbalncer url at http

Note The automation is done on assumption that the deployment will happen on an ec2 server using IAAC. For deploying on k8 the deployment stage can be updated as below.
For the kuberenetes based setup the using kubeconfig credentials the k8 cluster can be accessed and the given deployment and service manifest files can be executed. 
The it will create loadbalancer on k8 cluster only for getting it created on aws the user needs to install the loadbalncer controller on k8 and give permission using the iam role irsa.
The logging can be simuntaously enabled using prometheus, graffana on k8 running as a pod 
