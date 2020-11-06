require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nicknameとemail、passwordとpassword_confirmation、本名、フリガナ、誕生日が存在すれば登録できること" do
      #binding.pry
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      #binding.pry
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    #ここからemail

    it "emailが空では登録できないこと" do
      #binding.pry
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できないこと" do
      #binding.pry
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@を含まないと登録できないこと" do
      #binding.pry
      @user.email = "rakuten"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    #ここからpassword

    it "passwordが空では登録できないこと" do
      #binding.pry
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できないこと" do
      #binding.pry
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが不一致では登録できないこと" do
      #binding.pry
      @user.password = "123456"
      @user.password_confirmation = "123345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは英字のみでは登録できないこと" do
      #binding.pry
      @user.password = "abcabc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwaordには数字のみでは登録できないこと" do
      #binding.pry
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      #binding.pry
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #ここからlast_name

    it "last_nameが空だと登録できないこと" do
      #binding.pry
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameは英字では登録できないこと" do
      #binding.pry
      @user.last_name = "rakuten"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name には全角文字（漢字、ひらがな、カナ）を使用してください")
    end
    it "last_nameは数字を含んでは登録できないこと" do
      #binding.pry
      @user.last_name = "楽天3"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name には全角文字（漢字、ひらがな、カナ）を使用してください")
    end

    #ここからfirst_name

    it "first_nameが空だと登録できないこと" do
      #binding.pry
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameは英字では登録できないこと" do
      #binding.pry
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name には全角文字（漢字、ひらがな、カナ）を使用してください")
    end
    it "first_nameは数字を含んでは登録できないこと" do
      #binding.pry
      @user.first_name = "太郎3"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name には全角文字（漢字、ひらがな、カナ）を使用してください")
    end

    #ここからlast_name_kana

    it "last_name_kanaが空だと登録できないこと" do
      #binding.pry
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaは漢字では登録できないこと" do
      #binding.pry
      @user.last_name_kana = "楽天"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角文字（カナ）を使用してください")
    end
    it "last_name_kanaはひらがなでは登録できないこと" do
      #binding.pry
      @user.last_name_kana = "らくてん"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角文字（カナ）を使用してください")
    end
    it "last_name_kanaは英字では登録できないこと" do
      #binding.pry
      @user.last_name_kana = "rakuten"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角文字（カナ）を使用してください")
    end
    it "last_name_kanaは数字を含んでは登録できないこと" do
      #binding.pry
      @user.last_name_kana = "ラクテン3"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角文字（カナ）を使用してください")
    end

    #ここかfirstt_name_kana

    it "first_name_kanaが空だと登録できないこと" do
      #binding.pry
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaは漢字では登録できないこと" do
      #binding.pry
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角文字（カナ）を使用してください")
    end
    it "first_name_kanaはひらがなでは登録できないこと" do
      #binding.pry
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角文字（カナ）を使用してください")
    end
    it "first_name_kanaは英字では登録できないこと" do
      #binding.pry
      @user.first_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角文字（カナ）を使用してください")
    end
    it "first_name_kanaは数字を含んでは登録できないこと" do
      #binding.pry
      @user.first_name_kana = "タロウ3"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角文字（カナ）を使用してください")
    end

    #ここから誕生日

    it "birth_dayが空だと登録できないこと" do
      #binding.pry
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
   
  end
end