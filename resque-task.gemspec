# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resque/task/version"

Gem::Specification.new do |s|
  s.name        = "resque-task"
  s.version     = Resque::Task::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Fraser (modsognir)"]
  s.email       = ["j.fraser@modsognir.com"]
  s.homepage    = "http://github.com/modsognir/resque-task"
  s.summary     = %q{Helper for Resque jobs}
  s.description = %q{Helper for listing and viewing resque tasks at their various stages}

  s.rubyforge_project = "resque-task"
  
  s.add_dependency("activesupport")
  s.add_dependency("resque")
  s.add_dependency("rake", "0.8.7")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
