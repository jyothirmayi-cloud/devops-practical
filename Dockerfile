# Use the official Node.js image as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the application port (if the app listens on port 3000)
EXPOSE 3000

# Set environment variable for Node.js
ENV NODE_ENV=development

# Start the application
CMD ["npm", "start"]
