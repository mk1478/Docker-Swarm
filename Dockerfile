# Use the correct Node base image
FROM node:alpine

# Create app directory and set ownership to node user
RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json  ./

# Use the non-root 'node' user for security
USER node

# Assuming you still want to use yarn for consistency
RUN npm install 
# Copy the application code
COPY server.js .

# Expose the port matching our docker-compose.yml
EXPOSE 8080

# CRITICAL FIX: Define the command to start the server
CMD ["./wait_and_start.sh"]
