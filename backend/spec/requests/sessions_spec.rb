require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "new" do
    it "正常にレスポンスを返すこと" do
      get login_path
      expect(response).to have_http_status :success
    end
  end
  
  describe "destory" do
    before do
      user = FactoryBot.create(:user)
      post login_path, params: { session: { email: user.email,
                                            password: user.password } }
    end
    context "正常な値の場合" do
      it 'ログインアウトに成功すること' do
        delete logout_path
        expect(logged_in?).to_not be_truthy
      end
      it '２回連続でログアウトしても失敗しないこと' do
        delete logout_path        
        delete logout_path
        expect(logged_in?).to_not be_truthy
      end
    end
  end
  describe 'create' do
    let (:user) { FactoryBot.create(:user) }

    context '「ログイン状態を保持しますか？」のチェックボックスがONの場合' do
      it 'remember_tokenが空でないこと' do
        post login_path params: { session: { email: user.email,
                                             password: user.password, 
                                             remember_me: 1 }}                              
        expect(cookies[:remember_token]).to_not be_blank
      end
    end
    context '「ログイン状態を保持しますか？」のチェックボックスがOFFの場合' do
      it 'remember_tokenが空であること' do
        post login_path params: { session: { email: user.email,
                                             password: user.password, 
                                             remember_me: 0 }}                              
        expect(cookies[:remember_token]).to be_blank
      end
    end
  end
end
