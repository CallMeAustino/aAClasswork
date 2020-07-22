class Api::SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def destroy 
        @user = current_user
        if @user
            logout!
            render {}
        else
            flash[:errors] = @user.errors.full_messages#, status: 404
        end
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user 
            login!(@user)
            print 'got em'
            redirect_to "/"
        else
            flash[:errors] = ["Invalid username and password combination"]
        end
    end
end
