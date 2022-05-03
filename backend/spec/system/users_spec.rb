require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe "create" do
    context '無効な値の場合' do
      it 'エラーメッセージ用の表示領域が描画されること' do
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
        expect(page).to have_selector 'div.field_with_error'
        
      end
    end
    context "有効な値の場合" do
      it '成功時のflashが表示され、メイン画面にリダイレクトされること' do
        visit signup_path
        #▲user/newページが表示されたことを確認するのに、idが存在するか確認するのは一般的か？
        expect(page).to have_selector 'div#users_new'


      end
    end
    
  end
  

    

    # it "ユーザーがログインできること" do
    #   #現在のユーザー名がuser.nameであること
    #   expect(sign_in_as user)
    # end
    
end
