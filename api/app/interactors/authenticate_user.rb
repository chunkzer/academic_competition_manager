require 'bcrypt'

class AuthenticateUser
  include Interactor
  include BCrypt

  def call
    user = User.find_by!(username: context.username)
    originalPassword = user.password
    replacedPassword = originalPassword.sub!("$2y", "$2a")
    hashedPassword = Password.new(replacedPassword)
    if hashedPassword == context.password
    context.user = user
    else
      context.fail!
    end
    rescue => e
    context.fail!(message: e)
  end
end
