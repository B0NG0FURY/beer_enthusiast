class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create_with_omniauth

    def new
        @user = User.new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Username or password is incorrect"
            redirect_to login_path
        end
    end

    def create_with_omniauth
        user = User.find_or_create_by(username: auth['info']['email']) do |u|
            u.password = auth['uid']
        end
        if user
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Login through Google failed. Trying signing up or use a different Google account."
            redirect_to login_path
        end
    end

    def delete
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end