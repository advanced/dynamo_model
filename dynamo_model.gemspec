# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dynamo_model/version"

Gem::Specification.new do |s|
  s.name        = "dynamo_model"
  s.version     = DynamoModel::VERSION
  s.authors     = ["Ryan Weald"]
  s.email       = ["ryan@weald.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "dynamo_model"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "rspec"
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "guard-rspec"

  #This provides the low level interface to dynamo.
  s.add_dependency "aws-sdk"
  s.add_dependency "activemodel"
  s.add_dependency "activesupport"

end
