class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
     if @order.valid?
      @order.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end