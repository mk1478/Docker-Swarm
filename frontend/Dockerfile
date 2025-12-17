# Use a standard Nginx image
FROM nginx:alpine

# Remove default Nginx welcome page
RUN rm /usr/share/nginx/html/index.html

# Copy our simple index.html to the Nginx content directory
COPY index.html /usr/share/nginx/html/
