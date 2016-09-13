class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end
    
    def show
        @artist = Artist.find(params[:id])
        @anothers = Market.where(artist_id: @artist)
        
        #작가 프로필
        @profile = Profile.find_by(artistid: @market.artist.id)
        if @profile != nil
          @academics = @profile.academic.split(/\r\n/)
          @awards = @profile.awards.split(/\r\n/)
          @privates = @profile.privateexhibitions.split(/\r\n/)
          @teams = @profile.teamexhibitions.split(/\r\n/)
          @fairs = @profile.artfairs.split(/\r\n/)
          @possessions = @profile.possessions.split(/\r\n/)
          @etc = @profile.etc.split(/\r\n/)
        else
          @academics = "미등록"
          @awards = "미등록"
          @privates = "미등록"
          @teams = "미등록"
          @fairs = "미등록"
          @possessions = "미등록"
          @etc = "미등록"
        end
    end
end
