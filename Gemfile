# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"


gem "rails", "~> 6.0.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "devise"
gem "bootsnap", ">= 1.4.2", require: false
gem "mini_magick"
gem "image_processing", "~> 1.2"
<<<<<<< HEAD
gem "slim"
gem "kaminari"
gem "sentry-raven"
gem 'jquery-rails'
=======
gem 'haml-rails', '~> 2.0'
>>>>>>> jquery added
gem 'slim'

group :development, :test do
  gem "dotenv-rails"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", git: "https://github.com/rspec/rspec-rails", branch: "v4.0.0.beta3"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "pry"
  gem "pry-doc"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rails_config"
  gem "rubocop-rspec"
  gem "capistrano", "~> 3.11", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem "guard"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3"
  gem "guard-spork", "~> 2.1"
  gem "guard-bundler", require: false
  gem "guard-livereload", "~> 2.5", ">= 2.5.2"
  gem "rubycritic"
  gem "annotate"
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git'
end

group :test do
  gem "simplecov", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
