set :application, "goldstars"
set :repository,  "git@github.com:scottsampson/goldstars.git"

set :user, "ubuntu"

set :deploy_to, "/srv/#{application}"

set :deploy_via, :remote_cache
default_run_options[:pty] = true 

set :ssh_options, { :forward_agent => true, :user => "ubuntu" }

# load 'deploy'


# There are also new utility libaries shipped with the core these 
# include the following, please see individual files for more
# documentation, or run `cap -vT` with the following lines commented
# out to see what they make available.

# load 'ext/spinner.rb'              # Designed for use with script/spin
# load 'ext/passenger-mod-rails.rb'  # Restart task for use with mod_rails
# load 'ext/web-disable-enable.rb'   # Gives you web:disable and web:enable

set :scm, :git

role :web, "oops.cloudspace.com"
role :app, "oops.cloudspace.com"
role :db, "oops.cloudspace.com", :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

task :reset_permissions do
  run "sudo chown -R ubuntu:ubuntu /srv/#{application}"
end

namespace :apache do
  task :restart do
    run "service apache2 restart"
  end
end