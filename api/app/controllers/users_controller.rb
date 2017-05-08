class UsersController < ApplicationController
  skip_before_filter :verifier, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.where("role_id < ?", User.roles[@current_user.role_id.to_sym])
    @users = @users.where(User.concat.matches("%#{search_params[:search]}%")) if search_params[:search].present?
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
    if @current_user.id == @user.id || User.roles[@current_user.role_id.to_sym] < @user.role_id
      if user_params[:password].present?
        @user.password = user_params[:password]
        @user.encrypt_password
      end
      render nothing: true, status: 200 if @user.update(user_params.except(:password))
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :role_id)
    end
end
