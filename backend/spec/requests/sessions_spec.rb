require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "正常にレスポンスを返すこと" do
      get login_path
      expect(response).to have_http_status :success
    end
  end
  
  describe "DELETE /sessions" do
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
  
end
