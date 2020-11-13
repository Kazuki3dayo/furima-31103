class OrdersController < ApplicationController

  def index
    @order = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
 def order_params
  params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: params[:order_id], item_id: params[:item_id], user_id: current_user.id)
 end

end

