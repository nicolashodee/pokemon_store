class Cart < ApplicationRecord
  belongs_to :user
  has_many :join_table_item_cart
  has_many :items, through: :join_table_item_cart

  before_destroy :confirmation_command 
  def confirmation_command
    UserMailer.confirmation_command(self).deliver_now
  end
 
end
