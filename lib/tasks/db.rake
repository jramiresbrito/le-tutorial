namespace :db do
  desc 'Restart and seed the database'
  task restart: ['db:drop', 'db:create', 'db:migrate', 'db:seed']
end
