require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users #create" do
    context "無効な値の場合" do
      it '登録されないこと' do
      expect {
        post users_path, params: {user: { name: '',
                                          email: 'user@invalid.com',
                                          password: '!123abc',
                                          password_confirmation: '!!123abcd' } }
        }.to_not change(User, :count)
      end
    end
    context "有効な値の場合" do
      let(:user_params) { { user: { name: "TanakaTaro",
                                  email: "123taro@gmail.com",
                                  password: "Taro123",
                                  password_confirmation: "Taro123" } } }
      it '登録されること' do
        expect { 
          post users_path, params: user_params
        }.to change(User,:count).by 1
      end

      it 'メイン画面にリダイレクトされること' do
        post users_path, params: user_params
        expect(response).to redirect_to root_path
      end

      it 'ログイン状態であること' do
        post users_path, params: user_params
        expect(logged_in?).to be_truthy
      end
      
    end
  end
end

  # describe "GET index" do
  #   it# "リクエストが成功すること" do
  #     get users_url
  #     expect(response.status).to eq 200
  #   end
  # end
  # describe "GET show" do
  #   context "ユーザーが存在する場合" do
  #     it# "リクエストが成功すること" do
  #       get user_url user
  #       expect(response.status).to eq 200
  #     end
  #     it# "ユーザー名が表示されていること" do
  #       get user_url user
  #       expect(response.body).to include user.name
  #     end 
  #   end
  #   #context "ユーザーが存在しない場合" do
  #     #it "リクエストが成功しないこと" do
  #       #expect(get user_url 0).to raise_error ActiveRecord::RecordNotFound
  #      #end
  #   #end
  # end
  # describe# "GET new" do
  #   it 'リクエストが成功すること' do
  #     get new_user_url
  #     expect(response.status).to eq 200
  #   end
  # end
  # describe "GET edit" do
  #   it# "リクエストが成功すること" do
  #     get edit_user_url user
  #     expect(response.status).to eq 200
  #   end
  #   #it "ユーザー名が表示されること"
  #   #get edit_user_url user
  #     #expect(response.body).to include user.name
  #   #end
  # end
  # describe "POST create" do
  #   fdescribe "パラメーターが妥当な場合" do
  #     it# "リクエストが成功すること" do
  #       post users_url, params: { user: attributes_for(:user) }
  #       expect(response.status).to eq 200
  #     end
  #     #it "ユーザーが登録されること" do
  #       #expect do
  #         #user = attributes_for(:user)
  #         #post users_url, params: { user: attributes_for(:user) }
  #         #binding.pry
  #       #end.to change(User, :count).by(1)
  #     #end
  #     it# 'リダイレクトすること' do
  #       post :create, params: { user: FactoryBot.attributes_for(:user) }
  #       expect(response).to redirect_to User.last
  #     end
  #   end
  # end