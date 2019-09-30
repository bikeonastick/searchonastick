require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :benchmark, [:x] do |t,args|
  puts "benchmarking...#{args.x}"
end
