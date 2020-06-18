class ArtworksController < ApplicationController

    def index
        if params[:user_id] != nil
            @user = User.find(params[:user_id]) #return Salvador Dali
            @views = @user.shared_artworks #returns paintings Dali has seen <=== array of hashes
            @works = @user.artworks
            @result = @views + @works
             render json: @result
        else
            @artwork = Artwork.all
            render json: @artwork
        end
    end
# #--------------------
#     if params[:user_id]
#             user = User.find_by_id(params[:user_id])
#             render json: user.artworks + user.shared_artworks
#         else
#             render json: Artwork.all
#         end
#     end
# #-------------------
    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end
    
    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else    
            render json: @artwork.errors.full_messages, status: :unprocessable_entity 
        end    
    end


    def destroy
        @artwork = Artwork.find(params[:id])
        if @artwork.destroy
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private 

    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end