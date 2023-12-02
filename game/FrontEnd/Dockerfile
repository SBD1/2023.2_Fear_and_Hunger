# Use the official Node.js image as the base image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the port on which the application will run
EXPOSE 5173

# Command to run the application
# CMD ["npm", "run", "dev"]
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"];
