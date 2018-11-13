class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the Jungle')
  end

  def order_receipt(user, order, enhanced_cart)
    @user = user
    @order = order
    @enhanced_cart = enhanced_cart
    puts @user
    puts @order
    mail(to: @user.email, subject: "Your receipt for order \##{@order.id}")
  end
end
