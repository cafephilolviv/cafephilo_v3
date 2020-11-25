# frozen_string_literal: true

namespace :sidekiq do
  desc "Enable #{fetch(:sidekick_service)} in systemd"
  task :enable do
    on roles(:app) do
      execute("systemctl enable #{fetch(:sidekick_service)} --user")
    end
  end

  desc "Reload #{fetch(:sidekick_service)} in systemd"
  task :reload do
    on roles(:app) do
      execute("systemctl reload #{fetch(:sidekick_service)} --user")
    end
  end

  desc "Start #{fetch(:sidekick_service)} in systemd"
  task :start do
    on roles(:app) do
      execute("systemctl start #{fetch(:sidekick_service)} --user")
    end
  end

  desc "Restart #{fetch(:sidekick_service)} in systemd"
  task :restart do
    on roles(:app) do
      execute("systemctl restart #{fetch(:sidekick_service)} --user")
    end
  end

  desc "Stop #{fetch(:sidekick_service)} in systemd"
  task :stop do
    on roles(:app) do
      execute("systemctl stop #{fetch(:sidekick_service)} --user")
    end
  end
end
