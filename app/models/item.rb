class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :name, :description, :price, presence: true

  #商品詳細のバリデーション
  validates :category_id, :condition_id, numericality: { other_than: 1 }

  #配送についてのバリデーション
  validates :ship_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
end
