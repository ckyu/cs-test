namespace :setup do
  task :bootstrap do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end