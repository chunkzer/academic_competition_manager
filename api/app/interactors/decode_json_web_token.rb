class DecodeJsonWebToken
  include Interactor

  def call
    context[:payload] = (JWT.decode context[:token], Figaro.env.JWT_SECRET, true, { :algorithm => 'HS256' })[0]
  rescue => e
    context.fail!
  end

end
