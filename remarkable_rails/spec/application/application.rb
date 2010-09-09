# Create an application controller to satisfy rspec-rails, a dummy controller
# and define routes.
#
class ApplicationController < ActionController::Base
end

class Task; end

module MyApp
  class Application < Rails::Application
  end
end

MyApp::Application.routes.draw do |map|
  resources :projects, :has_many => :tasks
  match ':controller(/:action(/:id(.:format)))' # TODO remove
end
