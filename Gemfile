# frozen_string_literal: true

source "https://rubygems.org"

gemspec

group :base, :rspec, :rubocop do
  gem "rake", "~> 13.0"
end

group :debug do
  gem "pry"
end

group :rspec, :test do
  gem "rspec", "~> 3.0"
end

group :test do
  gem "vcr", "~> 6.2"
  gem "webmock", "~> 3.19", ">= 3.19.1"
  gem "simplecov"
  gem "simplecov-lcov"
end

group :rubocop do
  gem "standard", "~> 1.0"
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-md", "~> 1.0"
end
