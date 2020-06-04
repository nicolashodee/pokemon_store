class Admin::ItemsController < ApplicationController
  before_action :check_if_admin

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
    item_params = params.permit(:title, :description, :price, :picture)
  end
end
