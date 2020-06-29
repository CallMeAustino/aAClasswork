class SubsController < ApplicationController

    before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :update]
    
    def new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator = current_user.username

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def destroy
        @sub = Sub.find_by(id: params[:id]) && Sub.find_by(id: params[:id]).moderator.includes?(current_user.name)
        if !@sub.nil?
            @sub.destroy 
        end
        redirect_to subs_url
    end
    
    def update #exists on edit view
        @sub = Sub.find_by(id: params[:id])
        sub_title = params[:sub][:name]
        sub_description = params[:sub][:description]
        
        all_subs = Sub.all
        all_sub_titles = []
        
        all_subs.each do |sub|
            all_sub_titles << sub.title
        end

        if all_sub_titles.includes?(sub_title)
            flash[:errors] = @sub.errors.full_messages
        else
            @sub.title = sub_title
            @sub.description = sub_description
            if @sub.save
                redirect_to sub_url(@sub)
            else
                flash[:errors] = @sub.errors.full_messages
                render :edit
            end
        end
    end

    def edit #exists on show page , need to locate sub first
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator)
    end
end