class Charge < ApplicationRecord
 
 # pour le mailer
 after_initialize :confirmation_command
 def confirmation_command
   UserMailer.confirmation_command(self).deliver_now
 end

 after_initialize :command_to_admin
 def command_to_admin
   UserMailer.command_to_admin(self).deliver_now
 end
end