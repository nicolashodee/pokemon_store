class ChargesController < ApplicationController
  after_action :destroy_cart, only:[:create]

def new
    @cart = current_user.cart
    @amount = @cart.total_price.to_i
end

def create
  # Amount in cents
    @cart = current_user.cart
    @amount = @cart.total_price.to_i

customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

private

  def destroy_cart
    @cart = Cart.find_by(user: current_user).delete
    Cart.create(user_id: current_user.id)
  end


end
