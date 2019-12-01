# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'hanami-cli'

gem 'faraday'

gem 'semantic_logger'

gem 'dry-types'
gem 'dry-struct'
gem 'dry-system'
gem 'dry-container'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'dotenv'
end

group :test do
  gem 'rspec'
  gem 'webmock'
end
