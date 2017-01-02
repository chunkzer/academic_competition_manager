class UserSessionsController < ApplicationController
  # skip_before_filter :verifier, only: [:create, :createToken]

  def create
    @user = AuthenticateUser.call(user_params)[:user]
    if @user
      createToken
    else
      render :nothing => true, :status => 401
    end
  end

  def createToken
    context = {hash: {
                    user_id: @user.user_id,
                    role_id: @user.role_id,
                    full_name: @user.fullname,
                    email: @user.email
                  }
                }

    generated_token = CreateJsonWebToken.call(context)[:jwt]
    render json: {token: generated_token, payload: DecodeJsonWebToken.call({token: generated_token})[:payload]}
  end

  private

  def user_params
    params.permit(:username, :password, :token)
  end

end
