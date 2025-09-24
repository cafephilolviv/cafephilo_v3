# frozen_string_literal: true

require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/bundler'

require 'capistrano/scm/git'
require 'capistrano/nvm'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| load r }

install_plugin Capistrano::SCM::Git
