namespace :setup do
  desc "Resets the database and seeds patient database"
  task :bootstrap do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end