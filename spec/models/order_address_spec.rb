require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    it '必須項目が全て正しく記入されている場合は購入できる' do
      expect(@order).to be_valid
    end

    it 'postal_codeが空の場合は購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end

    it 'postal_codeに「-」がない場合は購入できない' do
      @order.postal_code = 123_456_789
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idが1の場合は購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'cityが空の場合は購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空の場合は購入できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingは空であっても購入できる' do
      @order.building = ''
      expect(@order).to be_valid
    end

    it 'phone_numが空の場合は購入できない' do
      @order.phone_num = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone num can't be blank", 'Phone num is invalid')
    end

    it 'phone_numは9文字以下の場合は購入できない' do
      @order.phone_num = 123_456_789
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone num is invalid')
    end

    it 'phone_numに「-」がある場合は購入できない' do
      @order.phone_num = 123 - 4567 - 8901
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone num is invalid')
    end

    it 'tokenが空の場合は購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
