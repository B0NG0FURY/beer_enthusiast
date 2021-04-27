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
        @user = User.find_by_id(params[:id])
        if !logged_in? || current_user.id != @user.id
            flash[:error] = "You can't access this. You must use your own account!"
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
