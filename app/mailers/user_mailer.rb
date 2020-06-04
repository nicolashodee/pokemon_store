class UserMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'

  def welcome_email(user)
    @user = user
    @url = 'mon-site.fr'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def confirmation_command(user)
    @user = user
    @url = 'mon-site.fr'
    mail(to: @user.email, subject: 'Ta commande est bien confirmé')
  end
end
