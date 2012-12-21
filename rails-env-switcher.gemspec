# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)
$:.unshift File.expand_path("../../lib", __FILE__)

require 'rails-env-switcher/version'

Gem::Specification.new do |s|
  s.name        = "rails-env-switcher"
  s.version     = RailsEnvSwitcher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Viennot"]
  s.email       = ["nicolas@viennot.biz"]
  s.homepage    = "http://github.com/nviennot/rails-env-switcher"
  s.summary     = "Switch from a Rails environment to another"
  s.description = "Switch from a Rails environment to another"

  s.add_dependency 'rails', '>= 3.0.0'

  s.files        = Dir["lib/**/*"] + ['README.md']
  s.require_path = 'lib'
  s.has_rdoc     = false
end
