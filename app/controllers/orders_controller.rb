class OrdersController < ApplicationController
  WALLETONE_SECRET_KEY='Ваш секретный ключ от Walletone'

def create
#    render json: params
  @payment = Walletone::Payment.new(
    WMI_MERCHANT_ID:    '147573326814',
    WMI_PAYMENT_AMOUNT:  params[:price], # Сумма
    WMI_CURRENCY_ID:     980, # ISO номер валюты (По умолчанию 643 - Рубль),
    WMI_PTENABLED:      ['WebMoneyRUB', 'WebMoneyUSD'], # Указывать не обязательно
    SOME_CUSTOM_FIELD:  'value'
    # etc любые другие поля
  )
  @payment.sign! WALLETONE_SECRET_KEY

 render partial: 'form', locals: { payment: @payment }
end
end
