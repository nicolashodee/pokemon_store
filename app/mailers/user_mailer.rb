class UserMailer < ApplicationMailer
  default from: 'pierratmarvin3@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://pokemonstorethpv0.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def confirmation_command(order)
    @order = order
    @user = @order.user
    @cart = @user.cart
    @url = 'https://pokemonstorethpv0.herokuapp.com/'
    mail(to: @user.email, subject: 'Ta commande est bien confirmé')
  end

end

