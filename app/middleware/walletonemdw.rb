class Walletonemdw < Walletone::Middleware::Base
  def perform notify, env
 end
end
WM = Walletonemdw.new
