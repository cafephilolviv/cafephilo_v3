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

append :linked_dirs, 'public/seed_images', 'storage'

set :project_name,      'cafephilo_v3_staging'
set :stage,             'staging'
set :shared_path,       '/home/cafephilo_deploy/staging/site/shared'
set :socket_path,       "#{fetch(:shared_path)}/tmp/sockets"
set :puma_sock,         "unix://#{fetch(:socket_path)}/cafephilo_v3_staging.sock"
set :puma_control,      "unix://#{fetch(:socket_path)}/pumactl.sock"
set :puma_state,        "#{fetch(:socket_path)}/puma.state"
set :puma_log,          "#{fetch(:shared_path)}/log/puma-#{fetch(:stage)}.log"
set :stage_log,         "#{fetch(:shared_path)}/log/#{fetch(:stage)}.log"
set :puma_service_name, 'puma-staging'
set :sidekick_service,  'sidekiq'

namespace :deploy do
  before 'deploy', 'deploy:source_env'
  after 'deploy:finished', 'puma:restart'
  after 'deploy:finished', 'sidekiq:restart'

  desc 'load env vars into session'
  task :source_env do
    on roles(:app) do
      execute 'source ~/.profile'
      execute 'source ~/.bashrc'
    end
  end
end
