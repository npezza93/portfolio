# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.3"

gem "pg"
gem "pry-rails"
gem "puma"
gem "rails"

group :development, :test do
  gem "rubocop"
end

group :development do
  gem "listen"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
