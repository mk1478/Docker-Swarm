#!/bin/sh

# The host name 'devops_db' is provided by Docker Swarm's internal DNS.
DB_HOST=devops_db
DB_PORT=5432

echo "Waiting for $DB_HOST:$DB_PORT to be ready..."

# Loop until a connection to the database host/port is successful
# We are intentionally using nc (netcat) because it's a common tool in Alpine images.
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1 
done

echo "Database is ready. Starting Node.js application..."

# Execute the application's original command
exec node server.js
