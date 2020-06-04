class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    price = 0
    current_user.cart.items.each{ |item| price += item.price }
    current_user.cart.update_attribute(:total_price, price)
  end

  def create
    params[:number_item] ? number_item = params[:number_item].to_i : number_item = 1
    @item = Item.find(params[:id])
    number_item.times do
      join_item_cart = JoinTableItemCart.new(item: @item, cart: Cart.find_by(user: current_user))
      if join_item_cart.save
        next
      else
        flash.now[:error] = "Une erreur s'est produite, tu n'as pas pu mettre ce(s) pokémon dans ton panier..."
        render 'items#index'
      end
    end
    flash[:success] = 'Bravo, tu ajouté un ou plusieurs item(s) à ton panier !'
    redirect_to root_path
  end

  def edit
    params[:number_item] ? number_item = params[:number_item].to_i : number_item = 1
    params[:item_id] ? @item = Item.find(params[:item_id]) : @item = Item.find(params[:id])
    JoinTableItemCart.find_each do |join|
      if join = JoinTableItemCart.find_by(item: @item, cart: Cart.find_by(user: current_user))
        join.delete
      end
    end
    number_item.times do
      join_item_cart = JoinTableItemCart.new(item: @item, cart: Cart.find_by(user: current_user))
      if join_item_cart.save
        next
      else
        flash.now[:error] = "Une erreur s'est produite, tu n'as pas pu modifier ton panier..."
        render 'items#index'
      end
    end
    flash[:success] = 'Bravo, tu modifié ton panier !'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    JoinTableItemCart.find_each do |join|
      if join = JoinTableItemCart.find_by(item: @item, cart: Cart.find_by(user: current_user))
        join.delete
      end
    end
    flash[:notice] = "Vous avez retiré un ou plusieurs pokémon de votre panier..."
    redirect_to cart_path(current_user.cart)
  end

end
