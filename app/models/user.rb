class User < ApplicationRecord
  after_create :add_cart
  has_one :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def add_cart
    cart = Cart.create(user: self)
  end

end
