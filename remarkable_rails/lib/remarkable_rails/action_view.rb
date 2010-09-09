module Remarkable
  module ActionView
  end
end

dir = File.dirname(__FILE__)
require File.join(dir, 'action_view', 'base')

# Load matchers
Dir[File.join(dir, 'action_view', 'matchers', '*.rb')].each do |file|
  require file
end

# Iinclude matchers in RSpec::Rails
if defined?(RSpec::Rails)
  Remarkable.include_matchers!(Remarkable::ActionView, RSpec::Rails::Example::FunctionalExampleGroup)
end

