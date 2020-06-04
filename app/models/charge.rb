class Charge < ApplicationRecord
 
 # pour le mailer
 after_create :confirmation_command
 def confirmation_command
   UserMailer.confirmation_command(self).deliver_now
 end

 after_create :command_to_admin
 def command_to_admin
   UserMailer.command_to_admin(self).deliver_now
 end
end