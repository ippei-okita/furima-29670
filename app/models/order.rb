class Order < ApplicationRecord
  has_one    :address
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true
end
