begin
  require 'rspec/core/rake_task'
  require 'simplecov'

  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

SimpleCov.start

desc 'Run test'
task :default => :spec
