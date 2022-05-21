RSpec.describe "Sessions",type: :system do
    describe "#new" do
        context "無効な値でログインした場合" do
            it 'flashメッセージが表示されること' do
                visit login_path

                fill_in "メールアドレス",	with: "" 
                fill_in "パスワード",	with: "" 
                click_button 'ログイン'
                
                expect(page).to  have_selector '.danger', text:'ログイン情報に誤りがあります'
                visit root_path
                expect(page).to_not have_selector '.danger'
            end
        end
        context "有効な値でログインした場合" do
            let (:user) { FactoryBot.create(:user) }

            it 'TOP画面が表示されること' do
                visit login_path
                fill_in "メールアドレス",	with: user.email
                fill_in "パスワード",	with: user.password
                click_button 'ログイン'

                expect(page).to_not have_selector "a[href=\"#{login_path}\"]"
                expect(page).to have_selector "a[href=\"#{logout_path}\"]"
                expect(page).to have_selector "a[href=\"#{user_path(user)}\"]"
            end
        end
    end
end
