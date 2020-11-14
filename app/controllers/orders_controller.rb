class OrdersController < ApplicationController

  def index
    @order = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    binding.pry
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
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @order[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end

