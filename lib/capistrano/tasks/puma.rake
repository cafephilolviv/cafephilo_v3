# frozen_string_literal: true

namespace :puma do
  desc "Enable #{fetch(:puma_service_name)} in systemd"
  task :enable do
    on roles(:app) do
      execute("systemctl enable #{fetch(:puma_service_name)} --user")
    end
  end

  desc "Reload #{fetch(:puma_service_name)} in systemd"
  task :reload do
    on roles(:app) do
      execute("systemctl reload #{fetch(:puma_service_name)} --user")
    end
  end

  desc "Start #{fetch(:puma_service_name)} in systemd"
  task :start do
    on roles(:app) do
      execute("systemctl start #{fetch(:puma_service_name)} --user")
    end
  end

  desc "Restart #{fetch(:puma_service_name)} in systemd"
  task :restart do
    on roles(:app) do
      execute("systemctl restart #{fetch(:puma_service_name)} --user")
    end
  end

  desc "Stop #{fetch(:puma_service_name)} in systemd"
  task :stop do
    on roles(:app) do
      execute("systemctl stop #{fetch(:puma_service_name)} --user")
    end
  end

  desc "Status #{fetch(:puma_service_name)} in systemd"
  task :status do
    on roles(:app) do
      execute("systemctl status #{fetch(:puma_service_name)} --user")
    end
  end
end
