class UserSessionsController < ApplicationController
  skip_before_filter :verifier, only: [:create, :createToken]

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
                    id_user: @user.id_user,
                    id_candidate_role: @user.id_candidate_role,
                    full_name: @user.get_fullname,
                    id_role: @user.id_role,
                    trello_app: Figaro.env.TRELLO_APP_KEY
                  }
                }

    generated_token = CreateJsonWebToken.call(context)[:jwt]
    render json: {token: generated_token, payload: DecodeJsonWebToken.call({token: generated_token})[:payload]}
  end

  def get_credentials
    render json: DecodeJsonWebToken.call(params)[:payload]
  end

  private

  def user_params
    params.permit(:username, :password, :token)
  end

end
