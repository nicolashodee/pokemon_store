class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :destroy_cart, only:[:create]

  def new
  end


  def create
    @cart = current_user.cart
    @amount = (@cart.total_price).to_i
  end

  def show
  	@cart = current_user.orders.last
    @join_table_item_cart = @order.items 
  end


  private

  def destroy_cart
    @cart = Cart.find_by(user: current_user).delete
    #je suis pas sûre que ça fonctionne, je trouve pas comment le vérifier dans la console
    Cart.create(user_id: current_user.id)
  end

end
