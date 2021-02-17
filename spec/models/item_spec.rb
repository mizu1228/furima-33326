require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '必要な情報を適切に入力すれば商品が投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it '商品名がないと出品できない' do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品名が40字以内でないと出品できない' do
        @item.item = "#{ "a" * 41 }"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it '商品説明がないと出品できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品説明が1000字以内でないと出品できない' do
        @item.explanation = "#{ "a" * 1001 }"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'カテゴリーがないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは選択必須です")
      end
      it '商品の状態についてがないと出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は選択必須です")
      end
      it '送料負担についてがないと出品できない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は選択必須です")
      end
      it '発送元が選択されていないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は選択必須です")
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.when_post_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は選択必須です")
      end
      it '価格がないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください", "値段は半角数字300~9999999の間で入力してください")
      end
      it '価格の範囲が300以上でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角数字300~9999999の間で入力してください")
      end
      it '価格の範囲が9999999以下でないと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角数字300~9999999の間で入力してください")
      end
      it '価格はが半角数字以外だと出品できない' do
        @item.price = "５０００あa"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角数字300~9999999の間で入力してください")
      end
      it '価格が半角英語のみだと出品できない' do
        @item.price = "five thousand"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角数字300~9999999の間で入力してください")
      end
    end
  end
end
