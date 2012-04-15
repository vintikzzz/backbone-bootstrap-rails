class TokensController < ApplicationController
  def show
    @token = form_authenticity_token
  end
end
