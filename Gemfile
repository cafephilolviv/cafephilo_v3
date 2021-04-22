# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'font-awesome-rails'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'mini_magick'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'pundit'
gem 'rails', '~> 6.1.3'
gem 'rails_admin', '~> 2.0', '>= 2.0.2'
gem 'rails_admin-i18n'
gem 'rails-i18n', '~> 6.0.0'
gem 'redis-namespace'
gem 'sass-rails', '~> 5'
gem 'sentry-raven'
gem 'sidekiq'
gem 'sitemap_generator'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.x'

group :development, :test, :staging do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.2'
end

group :development do
  gem 'annotate'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'guard-spork', '~> 2.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem 'pry-doc'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rails_config'
  gem 'rubocop-rspec'
  gem 'rubycritic'
  gem 'solargraph'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem "recaptcha", "~> 5.7"
