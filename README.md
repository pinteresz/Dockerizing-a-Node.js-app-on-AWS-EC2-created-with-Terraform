## Dockerizing-a-Node.js-app-on-AWS-EC2-created-with-Terraform

### :point_right: **In this project, I created an AWS infrastructure using Terraform. In the EC2 instance I've created, I dockerized a simple Hello, DevOps! Node.js app.** :point_left:

### **Steps:**

- [x] I **create**d the Node.js **app file** and the **Dockerfile**. (app.js, Dockerfile)
      
- [x] I created my **AWS infrastructure with Terraform**, an **EC2 instance in a public subnet**, and the other necessary resources for it. (main.tf)
      
- [x] I **copi**ed my Node.js app file (**app.js**) and **Dockerfile** from my local machine to the EC2 instance with the following command: _scp -i /path/to/my/key.pem /path/to/local/file username@ec2-instance-public-ip:/path/to/remote/destination_
      
- [x] I **connect**ed from my local machine to the EC2 using **ssh** with the following: _ssh -i /path/to/my/key.pem username@ec2-public-ip_
      
- [x] I **install**ed **Node.js** and **Docker** in the EC2 instance: _sudo yum install -y nodejs, sudo yum install -y docker_
      
- [x] To **start** the **Docker service** and enable it to start on boot, I used the following commands: _sudo systemctl start docker, sudo systemctl enable docker_
      
- [x] To **create** a **package.json** file and **install** the **"express"** package and create the **node_modules** directory and **package-lock.json** file, I used: _sudo npm init -y, sudo npm install express_
      
- [x] I **create**d a **Docker image** from the Dockerfile in the directory containing the Dockerfile: _sudo docker build -t <image_name> ._
      
- [x] I **ran** the **image** inside a Docker container on port 3000: _sudo docker run -dp 3000:3000 <image_name>_
      
- [x] From my local machine's web browser on ec2-public-ip:3000 and in the EC2 instance on **localhost:3000**, I could see **"Hello, DevOps!"**.
