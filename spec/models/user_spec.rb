require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録/ユーザー情報" do
    it "nameが空では登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "登録済みのメールアドレスでは登録できない" do
    end
    it "メールアドレスに@がないと登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが６文字以上でないと登録できない" do
    end
    it "passwordに半角英数両方が含まれていなければ、登録できない" do
    end
    it "確認用のpasswordが空では登録できない" do
    end
    it "passwordと確認用のpasswordが不一致だと登録できない" do
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名の苗字と名前がなければ登録できない" do
    end
    it "ユーザー本名が全角（漢字、平仮名、カタカナ）でない場合は登録できない" do
    end
    it "ユーザー本名のフリガナ、苗字と名前がなければ登録できない" do
    end
    it "ユーザー本名のフリガナは全角（カタカナ）でないと登録できない" do
    end
    it "生年月日が空では登録できない" do
    end
  end

  describe "トップページ" do
    it "ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること" do
    end
    it "ログイン状態では、ヘッダーにnameとログアウトボタンが表示されること" do
    end
    it "ヘッダーの新規登録/ログインボタンを押すと各ページに遷移すること" do
    end
    it "ヘッダーのログアウトボタンを押すと、ログアウトできること" do
    end
  end
end
