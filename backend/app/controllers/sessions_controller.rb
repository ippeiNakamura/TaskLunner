class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        #ユーザーが存在し、かつユーザー認証ができた場合
        if user && user.authenticate(params[:session][:password].downcase)
            log_in user
            #メイン画面にリダイレクト
            redirect_to root_path
        else
            #エラーメッセージを生成し、ログイン画面表示
            flash.now[:danger] =  "ログイン情報に誤りがあります"
            render 'sessions/new'
        end
    end
    
    def destroy
        log_out
        redirect_to root_path
    end
end
