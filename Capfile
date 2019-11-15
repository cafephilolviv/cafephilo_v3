require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/rails"


require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
