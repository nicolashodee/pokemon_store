class User < ApplicationRecord
  after_create :add_cart
  has_one :cart
  has_many :orders
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :dob, :address, presence: true

  def calculated_age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
         
  private

  def add_cart
    cart = Cart.create(user: self)
  end

  
  # pour le mailer
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
