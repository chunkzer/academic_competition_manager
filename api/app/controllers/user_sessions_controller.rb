class UserSessionsController < ApplicationController
  skip_before_filter :verifier, only: [:create, :createToken]

  def create
    @user = AuthenticateUser.call(user_params)[:user]
    if @user
      createToken
    else
      render nothing: true, status: 401
    end
  end

  def createToken
    context = {hash: {
                    user_id: @user.id,
                    role_id: @user.role_id,
                    full_name: @user.full_name,
                    email: @user.email
                  }
                }

    generated_token = CreateJsonWebToken.call(context)[:jwt]
    render json: {token: generated_token, payload: DecodeJsonWebToken.call({token: generated_token})[:payload]}
  end

  private

  def user_params
    params.require(:user_session).permit(:name, :last_name, :email, :password, :token)
  end

end
