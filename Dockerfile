# Dockerfile - serve Godot HTML export with nginx, COOP+COEP headers, SPA fallback
FROM nginx:stable-alpine

# Create directory for website
RUN mkdir -p /usr/share/nginx/html

# Copy site files (assume you put Godot export in ./public)
# If your export files are at repo root, change the source path accordingly
COPY public/ /usr/share/nginx/html/

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port (Render uses PORT env var, but nginx listens on 80 inside container)
EXPOSE 80

# Start nginx (default command is fine)
CMD ["nginx", "-g", "daemon off;"]
