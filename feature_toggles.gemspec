$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feature-toggles/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feature-toggles"
  s.version     = FeatureToggles::VERSION
  s.authors     = ["Louis Sayers"]
  s.email       = ["lssayers@gmail.com"]
  s.homepage    = "https://github.com/forward-labs/feature-toggles"
  s.summary     = %q{Feature Toggles for Rails}
  s.description = %q{Turn features on or off in various rails environments}
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/dummy/spec/**/*"]

  s.add_dependency "rails", "> 4.0.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
end
