
FROM node:20


# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./


RUN npm install

# Copy the rest of the application code to the container
COPY . .


# Copy the .env.example to .env
RUN cp .env.example .env

# Expose the application port
EXPOSE 3000

# Set environment variable for Node.js
ENV NODE_ENV=development

# Start the application

CMD ["npm", "start"]
