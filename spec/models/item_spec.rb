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
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '商品名が40字以内でないと出品できない' do
        @item.item = "#{ "a" * 41 }"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item is too long (maximum is 40 characters)")
      end
      it '商品説明がないと出品できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品説明が1000字以内でないと出品できない' do
        @item.explanation = "#{ "a" * 1001 }"
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'カテゴリーがないと出品できない' do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態についてがないと出品できない' do
        @item.item_status_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it '送料負担についてがないと出品できない' do
        @item.shipping_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 0")
      end
      it '発送元が選択されていないと出品できない' do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.when_post_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("When post must be other than 0")
      end
      it '価格がないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が300以上でないと出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字300~9999999の間で入力してください")
      end
      it '価格の範囲が9999999以下でないと出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字300~9999999の間で入力してください")
      end
      it '価格は半角数字でないと出品できない' do
        @item.price = "５０００あa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字300~9999999の間で入力してください")
      end
    end
  end
end
