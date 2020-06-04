# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

    def welcome_email
        UserMailer.welcome_email(User.first)

    end
    
    def confirmation_command
        UserMailer.confirmation_command(User.first)
    end

    def command_to_admin
        UserMailer.command_to_admin(User.first)
    end
end
