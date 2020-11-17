class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image)
  end

end
