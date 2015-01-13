set :application, 'traffic_hero'
set :repo_url, 'git@github.com:sabsowitz/traffic_hero_final.git'
set :deploy_to, '/home/rails/'
set :user, 'Prometheus'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :tmp_dir, "/home/rails/tmp"

namespace :deploy do

  %w[start stop restart].each do |command|
    desc 'Manage Unicorn'
    task command do
      on roles(:app), in: :sequence, wait: 1 do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end      
    end
  end

  after :publishing, :restart

end
