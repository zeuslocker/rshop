# frozen_string_literal: true
class Walletonemdw < Walletone::Middleware::Base
  def performnotify, env; end
end
WM = Walletonemdw.new
