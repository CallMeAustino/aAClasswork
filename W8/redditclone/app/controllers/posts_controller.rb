class PostsController < ApplicationController
    
    before_action :ensure_logged_in

    def new
        @post = Post.new
        render :new
    end 

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.sub_id = params[:sub_id]

        if @post.save
            # @posts = Sub.find_by(sub_id: params[:sub_id]).posts
            render :show
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])

        if !@post.nil?
            @post.delete
            render '/subs/show'
        end
    end
    
    def show    
        @posts = Post.find_by(id: params[:id])
        render :show
    end

    def index
        @posts = Post.all
        render :index    
    end

    def update
    end

    def edit
    end

    private
    
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
