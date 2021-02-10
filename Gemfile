
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'dry-validation'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'pathway'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sidekiq'
gem "sidekiq-cron", "~> 1.1"

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'pry-nav'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
