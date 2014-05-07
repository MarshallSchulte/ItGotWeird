namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute :touch, release_path.join('tmp/restart.txt')
      execute "sudo service unicorn restart"
    end
  end

  after :finishing, 'deploy:cleanup'
end
