class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        #ユーザーが存在し、かつユーザー認証ができた場合
        
        if user && user.authenticate(params[:session][:password])
            log_in user #一時セッションに保存
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
            redirect_to root_path
        else
            #エラーメッセージを生成し、ログイン画面表示
            flash.now[:danger] =  "ログイン情報に誤りがあります"
            render 'sessions/new'
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to root_path
    end
end
