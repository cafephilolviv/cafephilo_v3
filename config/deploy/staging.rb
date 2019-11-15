# frozen_string_literal: true

server '159.69.209.127',
       user: 'cafephilo_deploy',
       roles: %w[app db web]
set :project_name, 'cafephilo_v3_staging'
set :branch, 'develop'
set :deploy_to, '/home/cafephilo_deploy/staging/site/'
set :rails_env, 'staging'
set :normalize_asset_timestamps,
    %w[public/images public/javascripts public/stylesheets]
set :keep_assets, 2

stage        = 'staging'
shared_path  = '/home/cafephilo_deploy/staging/site/shared'
socket_path  = "#{shared_path}/tmp/sockets"
puma_sock    = "unix://#{socket_path}/puma.sock"
puma_control = "unix://#{socket_path}/pumactl.sock"
puma_state   = "#{socket_path}/puma.state"
puma_log     = "#{shared_path}/log/puma-#{stage}.log"
stage_log    = "#{shared_path}/log/#{stage}.log"

namespace :deploy do
  before 'deploy:assets:precompile', 'deploy:yarn_install'
  before 'deploy', 'deploy:source_env'
  after 'deploy:finished', 'server:restart'
  after 'deploy:finished', 'deploy:set_release'

  desc 'Run rake yarn:install'
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && RAILS_ENV=#{stage} yarn install")
      end
    end
  end

  desc 'load env vars into session'
  task :source_env do
    on roles(:app) do
      execute 'source ~/.profile'
      execute 'source ~/.bashrc'
    end
  end

  task :set_release do
    version = Open3.capture2('sentry-cli releases propose-version')[0].chomp
    system("sentry-cli releases new #{version} -p #{project_name}")
    system("sentry-cli releases set-commits --auto #{version}")
    system("sentry-cli releases deploys #{version} new -e #{stage}")
  end
end

namespace :server do
  desc 'Start the application'
  task :start do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage}
              && bundle exec puma -b '#{puma_sock}' -e #{stage} -t2:4
               --control '#{puma_control}' -S #{puma_state} >> #{puma_log} 2>&1 &",
              :pty => false
    end
  end

  desc 'Stop the application'
  task :stop do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=#{stage}
              && bundle exec pumactl -S #{puma_state} stop"
    end
  end

  desc 'Restart the application'
  task :restart do
    on roles(:app) do
      execute "cd #{current_path}
              && RAILS_ENV=#{stage}
              && bundle exec pumactl -S #{puma_state} restart"
    end
  end

  desc 'Status of the application'
  task :status do
    on roles(:app) do
      execute "cd #{current_path}
               && RAILS_ENV=#{stage}
               && bundle exec pumactl -S #{puma_state} stats"
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
