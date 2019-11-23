# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "cafephilo_v3"
set :repo_url, "git@gitlab.com:cafephilolviv/cafephilo_v3.git"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'
# set :linked_files, %w{config/master.key}

append :linked_files, "config/master.key"

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end
