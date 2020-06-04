class Admin::ItemsController < ApplicationController
  before_action :check_if_admin

  def index
    @total_sell = 0
    @count = 0
    if Order.all.size >= 1
      Order.all.each do |order|
        order.items.all.each do |item|
          @total_sell += item.price
          @count += 1
        end
      end
    end
    if @count == 0
      @average_price = 0
    else
      @average_price = @total_sell / @count
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(up_item_params)
    redirect_to admin_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    flash[:notice] = "Vous avez supprimé un pokémon du site..."
    redirect_back(fallback_location: root_path)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "Vous avez créé un nouveau Pokémon"
      redirect_to admin_items_path
    else
      flash.now[:error] = "Une erreur s'est produite, tu n'as pas pu créer ce Pokémon..."
      redirect_to new_admin_item_path
    end
  end

  private

  def check_if_admin
    if current_user.is_admin == true
      return true
    else
      flash[:error] = "Tu n'es pas administrateur"
      redirect_to root_path
    end
  end

  def item_params
    item_params = params.permit(:title, :description, :price, :image_url)
  end

  def up_item_params
    up_item_params = params.require(:item).permit(:title, :description, :price, :image_url)
  end
end
