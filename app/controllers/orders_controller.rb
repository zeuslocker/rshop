require "net/http"
require "uri"
class OrdersController < ApplicationController
  WALLETONE_SECRET_KEY='Ваш секретный ключ от Walletone'

def create
    x = 0
    @cart = session[:cart]
    @cart.each{|id, q| x+= Product.find(id).price * q }
  @payment = Walletone::Payment.new(
    WMI_MERCHANT_ID:    '147573326814',
    WMI_PAYMENT_AMOUNT:  x,
    WMI_CURRENCY_ID:     980, # ISO номер валюти 980 - гривня
    WMI_DESCRIPTION: 'Оплата заказа iStore!',
    WMI_CULTURE_ID: 'ru-RU',
    SOME_CUSTOM_FIELD:  'value'
  )
  @payment.sign! WALLETONE_SECRET_KEY
  uri = URI.parse('https://wl.walletone.com/checkout/checkout/Index')
  response = Net::HTTP.post_form(uri, @payment.to_h)
#  p 'hjgjhgffffffjhjj'+@payment.WMI_AUTO_LOCATION
 payment_uri = 'https://wl.walletone.com'+response.to_hash.fetch('location')[0]
 redirect_to payment_uri
#render partial: 'form', locals: {payment: @payment}
end
end
