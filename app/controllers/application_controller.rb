class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery
  layout 'fixed'
  before_filter :set_token
  before_filter :set_locale
  def set_token
    @token = form_authenticity_token
  end
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
