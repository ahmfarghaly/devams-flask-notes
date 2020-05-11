## Project Overview
A Pyhton-Flask webapp applying CI/CD with blue/green deployment strategy

### Project Features
* Flask web technology
* Containerized with Docker
* Clustered Amazon EKS
* CI/CD through Jenkins

### How to run
* Create the cluster with create_cluster bat/sh script file
* Blue branch will create the blue controller and select the blue version for load balancer
* Green branch will create the green controller and select the green version for load balancer


Checkout other branches for Blue & Green piplines