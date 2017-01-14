source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pry-rails"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.1"
gem "sqlite3"

group :development, :test do
  gem "rubocop"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
