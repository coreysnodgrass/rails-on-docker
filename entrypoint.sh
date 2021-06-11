#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Check if rails app exists yet
if [ ! -d "/myapp/app" ]; then

    if [ -f .env ]; then
        export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
    fi
    
    rails new . --skip-gemfile --skip-git --database=$DATABASE_TYPE && 
        cp /myapp/init/database.yml /myapp/config/database.yml
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"