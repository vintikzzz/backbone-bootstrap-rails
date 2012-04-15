class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery
  layout 'fixed'
end
