class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the Jungle')
  end

  def order_receipt(user, order)
    @user = user
    #email_with_name = "#{@user.first_name} <#{@user.email}>"
    @order = order
    puts @user
    puts @order
    mail(to: @user.email, subject: "Your receipt for order \##{@order.id}")
  end
end
