# Dockerized Ruby
This startup application can get you running with Ruby on rails quickly

# Getting Started
* Install [Docker](https://www.docker.com/)
* Point Command Line to receipt-processor folder
* Run `docker compose up -d`
* Database config is in `docker-compose.yml`
* Point browser at http://localhost:3000
* Database GUI located at http://localhost:8000


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