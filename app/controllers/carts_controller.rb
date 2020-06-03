class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    price = 0
    current_user.cart.items.each{ |item| price += item.price }
    current_user.cart.update_attribute(:total_price, price)
  end

  def edit
    if params[:number_item]
      number_item = params[:number_item].to_i
    else
      number_item = 1
    end
    @item = Item.find(params[:id])
    number_item.times do
      join_item_cart = JoinTableItemCart.new(item: @item, cart: Cart.find_by(user: current_user))
      if join_item_cart.save
        next
      else
        flash.now[:error] = "Une erreur s'est produite, tu n'as pas pu mettre cet item dans ton panier..."
        render 'items#index'
      end
    end
    flash[:success] = 'Bravo, tu ajouté un ou plusieurs item(s) à ton panier !'
    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:item_id])
    JoinTableItemCart.find_by(item: @item, cart: Cart.find_by(user: current_user)).delete
  end

end
