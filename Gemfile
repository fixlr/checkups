source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'dalli'
gem 'hipchat-api'
gem 'rake'
gem 'rufus-scheduler', require: false

group :development, :test do
  gem 'dotenv'
end

group :production do
  gem 'memcachier'
end
