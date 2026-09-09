# frozen_string_literal: true

source 'https://rubygems.org'

gem 'graphql', '~> 2.4'
# Ruby 4.0 ships json 3.0, whose JSON.parse dropped the positional options hash
# that ActiveSupport::JSON.decode still passes. Without this pin every JSON
# request body 400s with an ArgumentError. Drop it once Rails supports json 3.
gem 'json', '~> 2.19'
gem 'pg', '~> 1.5'
gem 'puma', '~> 8.0'
gem 'rails', '~> 8.1'

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
end
