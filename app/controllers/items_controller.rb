class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:update]
  before_action :set_item, only: [:show,:destroy,:edit,:update]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
    
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
