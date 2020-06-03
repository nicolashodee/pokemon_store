class ChargesController < ApplicationController

def new
    @cart = current_user.cart
    @amount = @cart.total_price
end

def create
  # Amount in cents
    @cart = current_user.cart
    @amount = @cart.total_price
end

private

  def destroy_cart
    @cart = Cart.find_by(user: current_user).delete
    Cart.create(user_id: current_user.id)
  end

end
