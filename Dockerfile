# Use the latest official Node.js image as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose a port that the app will listen on
EXPOSE 3000

# Specify the command to run the application
CMD ["node", "app.js"]
