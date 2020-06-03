class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def destroy
  	@item = Item.find(params[:id].to_i)
  	@item.destroy
  end

  private

  def item_params
    item_params = params.permit(:title, :description, :price, :image_url)
  end
end
