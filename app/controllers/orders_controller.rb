class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
     @order = OrderAddress.new
  end

  def create
     @order = OrderAddress.new(order_params)
     if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
     else
      render 'index'
     end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end