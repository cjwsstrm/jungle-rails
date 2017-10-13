class UserMailer < ApplicationMailer
 
  default from: 'no-reply@jungle.com'

  def order_email(user, order)
    @user = user
    @order = order
    @url = 'http://example.login'
    mail(to: @user.try(:email), subject: 'Jungle Purchase, order id: <%= @order.id %>')
  end
end
