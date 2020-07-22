class Api::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to "/"
        else
            flash[:errors] = @user.errors.full_messages
        end
    end

private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
