$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subdomain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subdomain"
  s.version     = Subdomain::VERSION
  s.authors     = ["Romeu Fonseca"]
  s.email       = ["romeu.hcf@gmail.com"]
  s.homepage    = "https://github.com/romeuhcf/multitenant"
  s.summary     = "Handling several subdomain on rails apps."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.3"

  s.add_development_dependency "sqlite3"
end
