class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
        if !@user
            flash[:error] = "You can't access this. You must create your own account!"
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
