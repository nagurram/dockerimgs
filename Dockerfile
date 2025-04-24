 # filepath: /E:/githubcode/Repos/dockerimgs/Dockerfile
# Use the official NGINX image as the base image
FROM nginx:latest

# Copy the custom NGINX configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML files for each app
COPY SiteMain.html /usr/share/nginx/html/sitemain/
COPY sitemainloader.js /usr/share/nginx/html/sitemain/
COPY Version1.html /usr/share/nginx/html/version1/
COPY Version2.html /usr/share/nginx/html/version2/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]