#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Check if rails app exists and .env exists, load and exec
if [ ! -d "/myapp/app" ]; then
    rails new . --skip-gemfile --skip-git --database=${DATABASE_TYPE} && 
    cp /myapp/init/database.yml /myapp/config/database.yml &&
    rake db:create
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"