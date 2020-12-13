class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]


  def index
    redirect_to root_path unless current_user.id != @item.user_id
    @order_user_address = OrderUserAddress.new(params[:order_user_address_id])
  end

  def create
    @order_user_address = OrderUserAddress.new(order_params)
    if @order_user_address.valid?
      pay_item
      @order_user_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_user_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:value],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
