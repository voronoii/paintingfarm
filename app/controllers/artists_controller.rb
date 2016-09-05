class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end
    
    def show
        @artist = Artist.find(params[:id])
        @anothers = Market.where(artist_id: @artist)
    end
end
