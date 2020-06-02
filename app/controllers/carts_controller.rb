class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    price = 0
    current_user.cart.items.each{ |item| price += item.price }
    current_user.cart.update_attribute(:total_price, price)
  end

  def update
    @item = Item.find(params[:item_id])
    join_item_cart = JoinTableItemCart.create(item: @item, cart: Cart.find_by(user: current_user))
  end

  def destroy
    @item = Item.find(params[:item_id])
    JoinTableItemCart.find_by(item: @item, cart: Cart.find_by(user: current_user)).delete
  end

end
