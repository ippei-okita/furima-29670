require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it '必須項目が全て正しく記入されている場合は投稿できる' do
      expect(@item).to be_valid
    end

    it '画像が添付されていない場合は投稿できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空の場合は投稿できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空の場合は投稿できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が空の場合は投稿できない' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it '商品の状態についての情報が空の場合は投稿できない' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end

    it '配送料の負担についての情報が空の場合は投稿できない' do
      @item.shipping = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank", "Shipping is not a number")
    end

    it '発送元の地域についての情報が空の場合は投稿できない' do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it '発送までの日数についての情報が空の場合は投稿できない' do
      @item.day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
    end

    it '販売価格が空の場合は投稿できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end

    it '販売価格が¥300~¥9,999,999の間にない場合は投稿できない' do
      @item.price = 299
      @item.price = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end

    it '販売価格が半角数字でない場合は保存できない' do
      @item.price = nil
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end
  end
end