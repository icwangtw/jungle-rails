class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'
  def receipt_email(orderid)
    @order = Order.find_by(id: orderid)
    mail(to: @order.email, subject: 'Thank for your order!')
  end
end
