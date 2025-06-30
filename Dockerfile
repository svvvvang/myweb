# Use the official Nginx image as a base
FROM nginx:latest

# Create a directory for your static files
RUN mkdir -p /usr/share/nginx/html

# Copy your static files into the container
COPY ./html /usr/share/nginx/html

# Change ownership of the necessary directories to the non-root user
RUN chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/log/nginx

# Expose the port Nginx will run on
EXPOSE 80

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Start Nginx as a non-root user
USER nginx

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
