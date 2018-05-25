class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'
  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thank for your order! Your Order ID is #{orderid}')
  end
end
