class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end
    
    def show
        @artist = Artist.find(params[:id])
        @anothers = Market.where(artist_id: @artist)
        
        #작가 프로필
        @profile = Profile.find_by(artistid: @artist.id)
        @academics = @profile.academic.split(/\r\n/)
        @awards = @profile.awards.split(/\r\n/)
        @privates = @profile.privateexhibitions.split(/\r\n/)
        @teams = @profile.teamexhibitions.split(/\r\n/)
        @fairs = @profile.artfairs.split(/\r\n/)
        @possessions = @profile.possessions.split(/\r\n/)
        @etc = @profile.etc.split(/\r\n/)
    end
end
