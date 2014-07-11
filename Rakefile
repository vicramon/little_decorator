require "bundler/setup"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

if !ENV["APPRAISAL_INITIALIZED"] && !ENV["TRAVIS"]
  require "appraisal/task"
  Appraisal::Task.new
  task default: :appraisal
else
  task default: :spec
end
