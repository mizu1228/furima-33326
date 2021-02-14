require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context 'ユーザー登録できるとき' do
      it '正しい情報を入力すればユーザー登録ができてトップページに遷移する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'name', with: @user.name
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      find("select[name='user[birth_day(1i)]']").select "1995"
      find("select[name='user[birth_day(2i)]']").select "12"
      find("select[name='user[birth_day(3i)]']").select "28"
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
      end
    end
    context 'ユーザー登録できないとき' do
      it '誤った情報ではユーザー登録できず、登録ページに戻ってくる' do
        visit root_path
        expect(page).to have_content('新規登録')
        visit new_user_registration_path
        fill_in 'name', with: ''
        fill_in 'email', with: ''
        fill_in 'password', with: ''
        fill_in 'password-confirmation', with: ''
        fill_in 'last-name', with: ''
        fill_in 'first-name', with: ''
        fill_in 'last-name-kana', with: ''
        fill_in 'first-name-kana', with: ''
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(0)
        expect(current_path).to eq('/users')
      end
    end
  end
end
