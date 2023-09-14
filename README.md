# Dockerizing-a-Node.js-app-on-AWS-EC2-created-with-Terraform

In this project, I created an AWS infrastructure using Terraform. In the EC2 instance I've created, I dockerized a simple Hello, DevOps! Node.js app.

Steps:

1. I created the Node.js app file and the Dockerfile. (app.js, Dockerfile)
2. I created my AWS infrastructure with Terraform, an EC2 instance in a public subnet, and the other necessary resources for it. (main.tf)
3. I copied my Node.js app file (app.js) and Dockerfile from my local machine to the EC2 instance with the following command: scp -i /path/to/my/key.pem /path/to/local/file username@ec2-instance-public-ip:/path/to/remote/destination
4. I connected from my local machine to the EC2 using ssh with the following: ssh -i /path/to/my/key.pem username@ec2-public-ip
5. I installed Node.js and Docker in the EC2 instance: sudo yum install -y nodejs, sudo yum install -y docker
6. To start the Docker service and enable it to start on boot, I used the following commands: sudo systemctl start docker, sudo systemctl enable docker
7. To create a package.json file and install the "express" package and create the node_modules directory and package-lock.json file, I used: sudo npm init -y, sudo npm install express
8. I created a Docker image from the Dockerfile in the directory containing the Dockerfile: sudo docker build -t <image_name> .
9. I ran the image inside a Docker container on port 3000: sudo docker run -dp 3000:3000 <image_name>
10. On localhost:3000 in the EC2 instance, I could see "Hello, DevOps!".
