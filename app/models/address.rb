class Address < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :prefecture

  with_options presense: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]+[0-9０-９]+\z/ }
  end

  validates :phene_num, presense: true, uniqueness: true, format: { with: /\A\d{11}\z/ }
  validates :order, presense: true

  end
end
