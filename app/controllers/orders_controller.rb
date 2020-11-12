class OrdersController < ApplicationController

  def index
    #binding.pry
    @order = Item.find(params[:item_id])
  end

  def create
  end
end

