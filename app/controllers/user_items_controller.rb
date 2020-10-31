class UserItemsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.user_item.present?
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = 'sk_test_f22d69ffab5f395a67434a9e'
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
