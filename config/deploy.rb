require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "coderay"

set :scm, :git
set :repository, "git@github.com:korny/coderay-website.git"
set :branch, "master"
set :deploy_via, :remote_cache

# set :rvm_ruby_string, '2.1.0'

role :web, "fallout-shelter"                          # Your HTTP server, Apache/etc
role :app, "fallout-shelter"                          # This may be the same as your `Web` server
role :db,  "fallout-shelter", :primary => true        # This is where Rails migrations will run

set :ssh_options, { :forward_agent => true }
set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/Kornelius-Kalnbach/#{application}"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

default_run_options[:pty] = true
