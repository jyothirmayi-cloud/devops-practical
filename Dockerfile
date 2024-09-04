# Use an official Node.js image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install the Node.js dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Copy the .env.example to .env
RUN cp .env.example .env

# Expose the application port
EXPOSE 3000

# Start the Node.js application
CMD ["npm", "start"]
