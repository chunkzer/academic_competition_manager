class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  after_filter :set_csrf_cookie_for_ng
  before_filter :verifier


  def record_not_found exception
    render :nothing => true, :status => 404
  end

  def verifier
    Rails.logger.info "Token Validator Called"
    binding.pry
    params[:payload] = JSON.parse(params[:payload]).symbolize_keys
    decodedPayload = DecodeJsonWebToken.call(params[:payload])[:payload].symbolize_keys
    if decodedPayload
      unless params[:payload][:role_id] == decodedPayload[:role_id] && params[:payload][:user_id].to_i == decodedPayload[:user_id]
        Rails.logger.info "CREDENTIALS DON'T MATCH PAYLOAD!"
        render :nothing => true, :status => 404 and return
      end
      @current_user = User.find(decodedPayload[:user_id])
    else
      Rails.logger.info "Invalid Token Signature"
      render :nothing => true, :status => 404 and return
    end
    Rails.logger.info "Token is valid"

  end


  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
