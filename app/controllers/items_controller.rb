class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private

  def item_params
    item_params = params.permit(:title, :description, :price, :image_url)
  end
end
