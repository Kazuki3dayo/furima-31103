class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :post_code, :prefecture_id, :city, :house_number, :phone_number, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'の発送情報を選択してください' }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'は正確に入力してください' }
  end

  def save
    # オーダー情報の保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
