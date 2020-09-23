require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "必須項目が全て正しく記入されている場合は登録できる" do
      expect(@user).to be_valid  
    end

    it "nicknameが空の場合は登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空の場合は登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複するemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが＠を含まない場合は登録できない" do
      @user.email = 'samplesample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end

    it "passwordが空の場合は登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下の場合は登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でない場合は登録できない" do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが存在してもpassword_confirmationが空の場合は登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空の場合は登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end

    it "first_nameが空の場合は登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "family_nameが正しく記入されていない場合は登録できない" do
      @user.family_name = 'ookita'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "first_nameが正しく記入されていない場合は登録できない" do
      @user.first_name = 'ippei'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "family_kanaが空の場合は登録できない" do
      @user.family_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kana can't be blank", "Family kana is invalid")
    end

    it "first_kanaは空の場合は登録できない" do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
    end

    it "family_kanaが正しく記入されていない場合は登録できない" do
      @user.family_kana = '大北'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kana is invalid")
    end

    it "first_kanaが正しく記入されていない場合は登録できない" do
      @user.first_kana = '一平'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end

    it "生年月日が空の場合は登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end