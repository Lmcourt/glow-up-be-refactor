source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ' ~> 2.7.0'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3.9'
gem 'bcrypt', '~> 3.1.13'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'graphql'
gem 'rack-cors'
gem 'dry-matcher', '~> 0.9.0'
gem 'dry-monads', '~> 1.4'
gem 'dry-rails', '~> 0.5.0'


group :test do
  gem 'database_cleaner-active_record'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'figaro'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
