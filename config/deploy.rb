# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "cafephilo_v3"
set :repo_url, "git@gitlab.com:cafephilolviv/cafephilo_v3.git"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'
# set :linked_files, %w{config/master.key}
