require 'rubygems'

RAILS_ENV     = 'test'
RAILS_VERSION = ENV['RAILS_VERSION'] || '3.0.0'
RSPEC_VERSION = ENV['RSPEC_VERSION'] || '2.0.0.beta.20' unless defined?(RSPEC_VERSION)

# Load Rails
gem 'activesupport', RAILS_VERSION
require 'active_support'

gem 'actionpack', RAILS_VERSION
require 'action_controller'

gem 'actionmailer', RAILS_VERSION
require 'action_mailer'

gem 'rails', RAILS_VERSION
require 'rails/all'

# Load Remarkable core on place to avoid gem to be loaded
dir = File.dirname(__FILE__)
require File.join(dir, '..', '..', 'remarkable', 'lib', 'remarkable')

# Add spec/application to load path and set view_paths
_RAILS_ROOT = File.join(dir, 'application')
$:.unshift(_RAILS_ROOT)

ActionController::Base.view_paths = _RAILS_ROOT
require File.join(_RAILS_ROOT, 'application')
require File.join(_RAILS_ROOT, 'tasks_controller')

# Load Remarkable Rails
require File.join(dir, 'functional_builder')

gem 'rspec-rails', RSPEC_VERSION
require 'rspec-rails'

$:.unshift File.join(dir, '..', '..', 'remarkable_activerecord', 'lib')
require File.join(dir, '..', 'lib', 'remarkable_rails')

# Register folders to example groups
Spec::Example::ExampleGroupFactory.register(:action_controller, RSpec::Rails::Example::ControllerExampleGroup)
