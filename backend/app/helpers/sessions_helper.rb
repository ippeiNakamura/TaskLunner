module SessionsHelper
    
    #渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    #現在ログイン中のユーザーを取得する
    def current_user
        #一時セッションにidが残っている場合
        if (user_id = session[:user_id])
            #そのidのユーザーをcurrent_userを格納
            @current_user ||= User.find_by(id: user_id)
        #永続的セッションにidが残っている場合
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                #ログインし、そのidのユーザーをcurrent_userを格納
                log_in user
                @current_user = user
            end
        end
    end
    
    #ログイン状態
    def logged_in?
        !current_user.nil?
    end

    #ログアウトする
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    #永続的セッションを発行する
    def remember(user)
        #remember_digestカラムにパスワードのハッシュ値を保存
        user.remember

        #永続的cookieに保存
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    #永続的セッションを破棄する
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
