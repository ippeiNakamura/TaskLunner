require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe "create" do
    context '無効な値の場合' do
      it 'エラーメッセージ用の表示領域が描画されること' do #▲エラーメッセージのテキストを確認する
        visit signup_path
        #▲user/newページが表示されたことを確認するのに、idが存在するか確認するのは一般的か？
        expect(page).to have_selector 'div#users_new'
  
        fill_in "名前",	with: " "
        fill_in "メールアドレス",	with: "user@invlid"
        fill_in "パスワード",	with: "foo"
        fill_in "パスワード（確認用）",	with: "bar" 
        click_button "登録する"
        
        expect(page).to have_selector 'div#users_new'
        expect(page).to have_selector 'div#error_explanation' 
      end
    end
    context "有効な値の場合" do
      let(:user_params) { { user: { name: "TanakaTaro",
                                  email: "123taro@gmail.com",
                                  password: "Taro123",
                                  password_confirmation: "Taro123" } } }

      it 'flashが表示されること' do #▲成功用のメッセージを確認するようにする
        post users_path, params: user_params
        expect(flash).to be_any
      end
    end
    
  end
  

    

    # it "ユーザーがログインできること" do
    #   #現在のユーザー名がuser.nameであること
    #   expect(sign_in_as user)
    # end
    
end
