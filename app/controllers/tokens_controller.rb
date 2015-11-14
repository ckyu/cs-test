class TokensController < ApplicationController
  # POST /token 
  def new
    app_key = params[:application_key]

    if app_key == Rails.application.config.application_key
      @token = Token.create
      render text: @token.token, status: 200
    else
      render :nothing => true, status: 401
    end
  end

end
