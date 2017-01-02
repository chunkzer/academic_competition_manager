class CreateJsonWebToken
  include Interactor

  def call
    context[:jwt] = JWT.encode context[:hash], Figaro.env.JWT_SECRET, 'HS256'
  end

end
