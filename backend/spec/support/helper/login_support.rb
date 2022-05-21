module LoginSupport
    def logged_in?
        !session[:user_id].nil?
    end 
    def sign_in_as(user)
        visit root_path
        fill_in "ユーザー名",with: user.name
        fill_in "パスワード名",with: user.name
        click_button "ログイン"
    end
    RSpec.configure do |config|
        config.include LoginSupport
    end
end