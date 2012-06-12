class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery
  layout 'fixed'
  before_filter do
    @token = form_authenticity_token
  end
end
