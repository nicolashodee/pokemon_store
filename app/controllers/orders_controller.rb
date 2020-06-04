class OrdersController < ApplicationController
  before_action :authenticate_user!


  def new
    @cart = current_user.cart
    @amount = @cart.total_price
    @user = current_user
    @order = Order.new(user_id: current_user.id)
    if @order.save
      @cart.items.each do |item|
        JoinTableOrderItem.create(item_id: item.id, order_id: @order.id)
      end
    end
    flash[:success] = 'Bravo, tu as confirmé ta commande, il ne te reste plus qu\'à payer !'
  end

  def create
    @cart = current_user.cart
    @amount = @cart.total_price
    @user = current_user
    @order = Order.new(user_id: current_user.id)
    if @order.save
      @cart.items.each do |item|
        JoinTableOrderItem.create(item_id: item.id, order_id: @order.id)
      end
    end
    flash[:success] = 'Bravo, tu as confirmé ta commande, il ne te reste plus qu\'à payer !'
  end

  def show
  	@cart = current_user.orders.last
    @join_table_item_cart = @order.items 
  end

end
