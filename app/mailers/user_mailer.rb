class UserMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'

  def welcome_email(user)
    @user = user
    @url = 'https://pokemonstorethpv0.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def confirmation_command(user)
    @user = user
    @url = 'https://pokemonstorethpv0.herokuapp.com/'
    mail(to: @user.email, subject: 'Ta commande est bien confirmé')
  end

  def command_to_admin(user)
    @user = user 
    @url = 'https://pokemonstorethpv0.herokuapp.com/'
    mail(to: @user.email, subject: 'Une commande a été passé sur le site')
  end
end

