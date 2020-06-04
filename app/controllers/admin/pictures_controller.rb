class Admin::PicturesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.picture.attach(params[:picture])
  end
end
