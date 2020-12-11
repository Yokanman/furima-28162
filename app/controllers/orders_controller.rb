class OrdersController < ApplicationController


  def index
    @item = Item.find(params[:item_id])
    @order_user_address = OrderUserAddress.new(params[:order_user_address_id])
  end

  def create
    binding.pry
    @order_user_address = OrderUserAddress.new(order_params)
    if @order_user_address.valid?
      @order_user_address.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end


  private

  def order_params
    params.require(:order_user_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

     end