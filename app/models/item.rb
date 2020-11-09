class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_charge
  belongs_to :prefectures
  belongs_to :days_to_ship

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  # 商品のバリデーション
  validates :name, :description, presence: true
  validates :price, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は¥300〜¥9,999,999の範囲内で入力してください' }

  # 商品詳細のバリデーション
  validates :category_id, :condition_id, numericality: { other_than: 1, message: 'の詳細情報を選択してください' }

  # 配送についてのバリデーション
  validates :ship_charge_id, :prefectures_id, :days_to_ship_id, numericality: { other_than: 1, message: 'の発送情報を選択してください' }
end
