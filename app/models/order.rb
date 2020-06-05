class Order < ApplicationRecord
  belongs_to :user
  has_many :join_table_order_item
  has_many :items, through: :join_table_order_item

   # pour le mailer
 after_create :confirmation_command 
 def confirmation_command
   UserMailer.confirmation_command(self).deliver_now
 end

end
.
