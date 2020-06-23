class SessionsController < ApplicationController
    
    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
        else
            redirect_to new_session_url
        end

    end

end