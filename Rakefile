#Rakefile

require 'cucumber'
require 'cucumber/rake/task'


task :default => :test

task :test => :cucumber_all_tests
task :smoke => :cucumber_smoke_tests


Cucumber::Rake::Task.new :cucumber_all_tests do |t|
  t.profile = 'all'
end


Cucumber::Rake::Task.new :cucumber_smoke_tests do |t|
  t.profile = 'smoketest'
end


