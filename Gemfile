source 'https://rubygems.org'

gem 'rails', github: 'rails/rails', branch: '3-2-stable'
gem 'mysql2', '~> 0.3.20'
gem 'coderay'

# prevent updating the server's gems
gem 'rake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'sass-rails'
  
  gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails', github: 'rails/jquery-rails', branch: '3-1-stable'
gem 'prototype-rails' #, :git => 'git://github.com/rubychan/prototype-rails.git'
gem 'haml'

# web server
# gem 'unicorn'
# gem 'passenger'

group :development do
  # Deploy with Capistrano
  gem 'capistrano', '~> 2.15.5'  # TODO: capistrano 3 is a rewrite, need to rewrite Capfile
  gem 'rvm-capistrano', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

# monitoring
# gem 'newrelic_rpm'

# To use debugger
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# outsourced Rails parts
gem 'dynamic_form'
gem 'will_paginate', '~> 3.0.7'

# gem 'syntax', :require => 'syntax/convertors/html'
# gem 'highlight', :require => 'simplabs/highlight'
# gem 'ink'
# gem 'pygmentize'
# gem 'rb-pygments'
# gem 'pygments.rb'
# gem 'rygments'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  # gem 'term-ansicolor', :require => 'term/ansicolor'
  # gem 'annotate'
  gem 'quiet_assets'
  # gem 'ruby-prof'
  # gem 'webrat'
end

group :production do
  # gem 'bugsnag'
end

group :test do
  # Pretty printed test output
  # gem 'turn', :require => false
  # gem 'minitest', '~> 4.7'  # avoid strange warnings
  gem 'test-unit', '~> 3.0'
end
