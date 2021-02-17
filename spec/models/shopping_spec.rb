require 'rails_helper'

RSpec.describe Shopping, type: :model do
  describe '購入機能' do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @shopping = FactoryBot.build(:shopping, user_id: @user.id, item_id: @item.id )
      sleep(1)
    end

    context '購入できる時' do

      it '必要な情報を正しく入力すれば購入できること' do
        expect(@shopping).to be_valid
      end
      it 'buildingがなくても購入できること' do
        @shopping.building = ""
        expect(@shopping).to be_valid
      end
    end

    context '購入できない時' do

      it 'tokenが空では購入できないこと' do
        @shopping.token = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'userが紐づいていないと購入できないこと' do
        @shopping.user_id = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていないと購入できないこと' do
        @shopping.item_id = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号がないと購入できないこと' do
        @shopping.zip_code = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフン(-)を入れて、正しい桁数で入力してください")
      end
      it '郵便番号にハイフン-がないと購入できないこと' do
        @shopping.zip_code = "0000000"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("郵便番号はハイフン(-)を入れて、正しい桁数で入力してください")
      end
      it '郵便番号の桁が正しくないと購入できないこと' do
        @shopping.zip_code = "00"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("郵便番号はハイフン(-)を入れて、正しい桁数で入力してください")
      end
      it '都道府県が選択されていないと購入できないこと' do
        @shopping.prefecture_id = 0
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("都道府県は必須です")
      end
      it '市区町村が空だと購入できないこと' do
        @shopping.city = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できないこと' do
        @shopping.address = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できないこと' do
        @shopping.phone_num = ""
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("電話番号を入力してください", "電話番号は半角数字10または11桁で入力してください(ハイフン不要)")
      end
      it '電話番号が10桁又は11桁でないと購入できないこと' do
        @shopping.phone_num = "123456789"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("電話番号は半角数字10または11桁で入力してください(ハイフン不要)")
      end
      it '電話番号が半角数字でないと購入できないこと' do
        @shopping.phone_num = "００あ漢字a"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("電話番号は半角数字10または11桁で入力してください(ハイフン不要)")
      end
      it '電話番号にハイフン-があると購入できないこと' do
        @shopping.phone_num = "000-0000-0000"
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("電話番号は半角数字10または11桁で入力してください(ハイフン不要)")
      end
    end
  end
end
