require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    context "新規登録できるとき" do
      it "name,email,password(確認用含む)があれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが英数混合６字以上なら登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "登録済みのメールアドレスでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@がないと登録できない" do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字以上でないと登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には記号以外、半角英数字の両方を含めて設定してください")
      end
      it "passwordが英語だけでは登録出来ない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には記号以外、半角英数字の両方を含めて設定してください")
      end
      it "passwordと確認用のpasswordが不一致だと登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe "新規登録/本人情報確認" do
    context "新規登録できるとき" do
      it "ユーザーの姓名(フリガナ名含む)、生年月日があれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "ユーザー本名の苗字がなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の名前がなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名の苗字が全角（漢字、平仮名、カタカナ）でない場合は登録できない" do
        @user.first_name = "苗字でスfamilyname"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it "ユーザー本名の名前が全角（漢字、平仮名、カタカナ）でない場合は登録できない" do
        @user.last_name = "名前でスgivenname"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it "ユーザー本名のフリガナ苗字がなければ登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名のフリガナ名前がなければ登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "ユーザー本名のフリガナ苗字は全角カタカナでないと登録できない" do
        @user.first_name_kana = "漢字ひらがなfamily123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana には全角カタカナを使用してください")
      end
      it "ユーザー本名のフリガナ苗字は全角カタカナでないと登録できない" do
        @user.last_name_kana = "漢字ひらがなgiven123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カタカナを使用してください")
      end
      it "生年月日が空では登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
