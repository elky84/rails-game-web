#require "bundler/capistrano" # for bundle (gem) auto installation
require "whenever/capistrano"

# capistrano-unicorn 을 사용하면 unicorn gem dependency 가 생겨서 윈도우 셋업이 번거롭다
#require 'capistrano-unicorn'

set :application, "sunbee_web"
set :repository,  ""
set :scm, :svn

set :rails_env, :production
set :user, "root"

set :deploy_to, "/home/root/sunbee_web"

default_run_options[:pty] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.0.40"                       # Your HTTP server, Apache/etc
role :app, "192.168.0.40"                       # This may be the same as your `Web` server
role :db,  "192.168.0.40", :primary => true 	# This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# capistrano-unicorn 을 사용안함
# after deplay, restart unicorn ( app launcher )
#after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
#after 'deploy:restart', 'unicorn:restart'  # app preloaded

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} service unicorn start"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} service unicorn stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} service unicorn restart"
  end
end

# after deplay, db migrate
after "deploy", "deploy:migrate"

# create shared filder
task :create_log_share do
  run "mkdir -p #{shared_path}/log"
  run "mkdir -p #{shared_path}/pids"
end

before 'deploy:update', :create_log_share

