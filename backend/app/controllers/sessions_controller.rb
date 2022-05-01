class SessionsController < ApplicationController
    def create
        user = User.find_by(mail:params[:name])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            if user.projects.count == 0
                redirect_to new_user_project_path(user)
            else
                redirect_to user_projects_path(user)
            end
            
        else
            flash.alert = "名前とパスワードが一致しません"
            redirect_to :root
        end
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
