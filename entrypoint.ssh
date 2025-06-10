#!/bin/sh

# Replace placeholders in Nginx template using envsubst
envsubst '${API_HOST}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
nginx -g "daemon off;"
