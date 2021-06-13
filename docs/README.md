# Ruby on Rails with Docker Compose
This startup application can get you running with Ruby on rails quickly. One command and you're ready to run!

# Getting Started
* Install [Docker](https://www.docker.com/)
* Open your favorite Command Line Interface at this folder
* Execute command - `docker compose up -d`

# Web Locations
* Rails app - http://localhost:3000
* PgAdmin GUI (database) - http://localhost:8000

# Settings
* PgAdmin Login - `docker-compose.yml`
* Ruby Database config - `init/database.yml`


# Commands
## Open Terminal inside Docker
* `docker compose exec web /bin/bash` - When container is not started
* `docker exec -it receipt-processor_web_1 bash` - When container is started

## RSpec Install
* `gem install rspec-rails`
### Add the below in the config under group :test and :development
* `gem 'rspec-rails', '~> 5.0.0'`
* `rails generate rspec:install`
* `rspec` - Run inside Terminal

## Active Storage Install
* `rails active_storage:install`
* `rails db:migrate` - Run Migrations

## Rails Commands
* `rails g model {model name}` - Create model
* `rails d model {model name}` - Remove model

## Docker Commands
* `docker compose build` - Rebuild code after all ruby code changes
* `docker compose up -d` - Run containers in daemon mode
* `docker compose run web rake db:create` - Execute rake command to create database
* `docker compose down` Shutdown and remove running containers

## Resolutions for getting out of a pickle
* `docker volume ls`
* `docker volume prune` - **DANGER** Prune all Docker volumes
* `docker rmi $(docker images -a -q)`  - **DANGER** Prune all Docker images
* `docker volme rm {vol_name}`

## Attaching for byebug debugging
1. Include `stdin_open: true tty: true` in docker compose file
2. `docker compose up -d` - Run containers in daemon mode
3. `docker ps -a` - Show running containers to find Container ID to attach to
4. `docker attach {container ID}` - Interact with byebug when command is reached

## Autoloaded paths
* `rails r 'puts ActiveSupport::Dependencies.autoload_paths'`

## Special Ruby Commands Notes
* `<%= debug @document.image %>` - Showing the image debug variables in the show.erb

## Resources that helped
* https://guides.rubyonrails.org/v5.2/
* https://docs.docker.com/samples/rails/
* https://github.com/docker-library/docs/blob/master/postgres/README.md
* https://rubygems.org/
* https://www.fastruby.io/blog/ruby/rails/versions/compatibility-table.html
* https://github.com/vovimayhem/docker-compose-rails-dev-example/blob/master/doc/CREATE_A_NEW_RAILS_PROJECT.md
* https://github.com/vovimayhem/docker-compose-rails-dev-example
* https://github.com/ledermann/docker-rails
* https://developers.maxihost.com/docs/dockerize-a-rails-application-on-ubuntu-1804
* https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
* https://stackoverflow.com/questions/51073235/rails-active-storage-open-download-link