# Step 1: Build the React frontend
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy package.json and lock file first to install deps
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the project for production
RUN npm run build

# Step 2: Serve the production build with Nginx
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built frontend from previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy custom Nginx config (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
