class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :destroy_cart, only:[:create]

  def new
  end

  def create
    @cart = current_user.cart
    @amount = @cart.price * 100
  end

  def show
  	@cart = current_user.orders.last
    @join_table_item_cart = @order.items 
  end


  private

  def destroy_cart
    @cart = Cart.find_by(user: current_user).delete
    Cart.create(user_id: current_user.id)
  end

end
