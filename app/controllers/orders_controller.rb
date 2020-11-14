class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Item.find(params[:item_id])
    if current_user != @order.user && @order.order.nil?
      @order_shipping = OrderShipping.new
    else
      redirect_to root_path
    end
  end

  def create
    @order = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: params[:order_id], item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @order[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
