class UserItemsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @buy = Buy.new
    if current_user.id == @item.user_id || @item.user_item.present?
      redirect_to root_path
    end
  end

  def create
   
   @item = Item.find(params[:item_id])
   @buy = Buy.new(buy_params)
   binding.pry
     if @buy.valid?
      @buy.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private

  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
