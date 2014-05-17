require "bundler/capistrano"

set :application, "coderay"
set :repository,  "svn+ssh://rubychan.de/var/svn/coderay-website/new/trunk/"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "rubychan.de"                          # Your HTTP server, Apache/etc
role :app, "rubychan.de"                          # This may be the same as your `Web` server
role :db,  "rubychan.de", :primary => true        # This is where Rails migrations will run

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/murphy/www/#{application}-cap"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
