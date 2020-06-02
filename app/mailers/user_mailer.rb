class UserMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite-de-jojo.herokuapp.com/login/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
