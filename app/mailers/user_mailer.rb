class UserMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'

  def welcome_email(user)
    @user = user
    @url = 'mon-site.fr'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
