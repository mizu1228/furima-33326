require 'rails_helper'

RSpec.describe "商品出品", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item_image = 'public/images/test_image.png'
  end
  context '商品出品できるとき' do
    it 'ログインユーザーは出品できる' do
      #ログイン処理
      visit new_user_session_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      #投稿
      expect(page).to have_content('出品する')
      visit new_item_path
      find("input[name='item[image]']").attach_file @item_image
      fill_in "item-name", with: @item.item
      fill_in "item-info", with: @item.explanation
      find("select[name='item[category_id]']").select "メンズ"
      find("select[name='item[item_status_id]']").select "新品、未使用"
      find("select[name='item[shipping_id]']").select "着払い(購入者負担)"
      find("select[name='item[prefecture_id]']").select "青森県"
      find("select[name='item[when_post_id]']").select "1〜2日で発送"
      fill_in "item-price", with: "3000"
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      visit root_path
      expect(page).to have_content @item.item
    end
  end
  context '商品出品できないとき' do
    it '未ログインだと新規投稿ページに遷移できない' do
      visit new_item_path
      expect(current_path).to eq(new_user_session_path)
    end
  end

end
