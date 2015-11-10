class TokensController < ApplicationController
  # POST /token 
  def new
    app_key = params[:application_key]
    
    if app_key == Rails.application.config.application_key
      logger.debug "Success, correct application key!"
      @token = Token.create
      render text: @token.token, status: 200
    else
      logger.debug "ERR. Wrong application key."
      render :nothing => true, status: 401
    end
  end

end
