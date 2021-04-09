class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to signup_path
        end
    end

    def show
        @user = current_user
        if !@user
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
