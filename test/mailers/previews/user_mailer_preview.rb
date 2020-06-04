# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def confirmation
        UserMailer.confirmation_command()
    end

    def welcome
        UserMailer.welcome_email(
        )
    end
end
