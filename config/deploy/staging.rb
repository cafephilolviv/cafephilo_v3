# frozen_string_literal: true

server '159.69.209.127',
       user: 'cafephilo_deploy',
       roles: %w[app db web]

set :project_name, 'cafephilo_v3_staging'
set :branch, 'develop'
set :deploy_to, '/home/cafephilo_deploy/staging/site/'
set :normalize_asset_timestamps,
    %w[public/images public/javascripts public/stylesheets]
set :keep_assets, 2

append :linked_dirs, 'public/seed_images'

project_name = 'cafephilo_v3_staging'
stage        = 'staging'
shared_path  = '/home/cafephilo_deploy/staging/site/shared'
socket_path  = "#{shared_path}/tmp/sockets"
puma_sock    = "unix://#{socket_path}/cafephilo_v3_staging.sock"
puma_control = "unix://#{socket_path}/pumactl.sock"
puma_state   = "#{socket_path}/puma.state"
puma_log     = "#{shared_path}/log/puma-#{stage}.log"
stage_log    = "#{shared_path}/log/#{stage}.log"

namespace :deploy do
  before 'deploy', 'deploy:source_env'
  after 'deploy:finished', 'server:restart'

  desc 'load env vars into session'
  task :source_env do
    on roles(:app) do
      execute 'source ~/.profile'
      execute 'source ~/.bashrc'
    end
  end
end

namespace :server do
  desc 'Start the application'
  task :start do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec puma -b '#{puma_sock}' -e #{stage} -t2:4 --control '#{puma_control}' -S #{puma_state} >> #{puma_log} 2>&1 &", :pty => false
    end
  end

  desc 'Stop the application'
  task :stop do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} stop"
    end
  end

  desc 'Restart the application'
  task :restart do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} restart"
    end
  end

  desc 'Status of the application'
  task :status do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage} && bundle exec pumactl -S #{puma_state} stats"
    end
  end

  task :puma_log do
    on roles(:app) do
      execute "tail -n 50 #{puma_log}"
    end
  end

  task :log do
    on roles(:app) do
      execute "tail -n 50 #{stage_log}"
    end
  end
end
