class UsersController < ApplicationController

    def index
       @users = User.all
       render json: @users
    end

     def show
        # debugger
        @user = User.all.where("id = #{params[:id]}") #User.all.find(params[:id])
            render json: @user
    end

    def create
        @user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        # debugger
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end

private

    def user_params 
        params.require(:user).permit(:username) #<==== takes params and filters relevant params that exist within the subhash "user". the user hash must
                                                            #be defined within the input methods. 
    end
end
