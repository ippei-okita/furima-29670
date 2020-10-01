class Address < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :prefecture

  with_options presense: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
  end

  validates :phene_num, presense: true, uniqueness: true
  validates :order, presense: true
  
  end
end
