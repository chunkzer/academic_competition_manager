class UsersController < ApplicationController
  skip_before_filter :verifier, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    existingUser = User.find_by(email: user_params[:email])
    unless existingUser
      user = CreateUser.call({user_params: user_params})[:user]
      UserMailer.welcome_email(user, user_params[:password]).deliver_later
      render json: user, status: :created
    else
    render nothing: true, status: 403 and return
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @current_user.role_id != "student" && @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :role_id)
    end
end
