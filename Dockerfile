# Step 1: Build the React frontend0
FROM node:18 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Step 2: Serve with NGINX
FROM nginx:alpine

# Clean default html
RUN rm -rf /usr/share/nginx/html/*

# Copy React build output
COPY --from=build /app/dist /usr/share/nginx/html

# Copy NGINX template and entrypoint script60
COPY nginx.conf /etc/nginx/templates/default.conf.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
