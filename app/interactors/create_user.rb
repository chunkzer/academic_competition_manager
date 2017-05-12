class CreateUser
  include Interactor

  def call
    @user = User.new(context[:user_params])
    @user.encrypt_password
    @user.role_id = 1
    if @user.save
      context[:user] = @user
    else
      context.fail!
    end
  end
end
