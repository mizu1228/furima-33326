require 'rails_helper'

RSpec.describe Shopping, type: :model do
  describe '購入機能' do

    before do
      @shopping = FactoryBot.build(:shopping)
    end

    context '購入できる時' do

      it '必要な情報を正しく入力すれば購入できること' do
        expect(@shopping).to be_valid
      end
    end

    context '購入できない時' do

      it 'tokenが空では購入できないこと' do
      end
      it '郵便番号がないと購入できないこと' do
      end
      it '郵便番号にハイフン-がないと購入できないこと' do
      end
      it '郵便番号の桁が正しくないと購入できないこと' do
      end
      it '都道府県が選択されていないと購入できないこと' do
      end
      it '市区町村が空だと購入できないこと' do
      end
      it '番地が空だと購入できないこと' do
      end
      it '電話番号が空だと購入できないこと' do
      end
      it '電話番号が10桁又は11桁の整数でないと購入できないこと' do
      end
    end
  end
end
