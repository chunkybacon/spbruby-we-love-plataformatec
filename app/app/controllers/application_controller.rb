class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  inherit_resources
  include InheritedResources::DSL
end
