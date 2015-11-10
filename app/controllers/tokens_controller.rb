class TokensController < ApplicationController
  # POST /token 
  def new
    app_key = params[:application_key]
    
    if app_key == Rails.application.config.application_key
      logger.debug "Success, correct application key!"
      @token = Token.create
      # render text: "#{request.body.read}"
      # render json: @token
      # respond_with @token
      render text: "Token: #{@token.token}\nExpires On: #{@token.expires_on}"
    else
      logger.debug "ERR. Wrong application key."
    end
  end

end
