class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 20 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end