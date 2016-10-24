class MypageController < ApplicationController
    
    def index
        @artist = current_user
       
        if Artist.find(@artist.artist).nil?
            @counts = 0
            @arts = nil
        else 
            @counts = Market.where("artist_id = ?", @artist.artist).count
            @arts = Market.where(artist_id: @artist.artist)
        end
    end
    
    def new
    end
    
    def create
        u = User.find_by(id: params[:user_id])
          u.update(room: params[:image]) 
         flash[:notice] = "사진이 등록되었습니다!"
         redirect_to :back       
    end
    
    def update
        n = User.find(params[:id])
        n.update(nickname: params[:newnick])
        n.save
        flash[:notice] = "닉네임이 수정되었습니다!"
        redirect_to '/mypage'
    end
    
    def delete
    end
    
    
    
    def artist_profile
    end
    
    def artist_profile_create
        Profile.create(artistid: params[:artistid], academic: params[:academic], awards: params[:awards], privateexhibitions: params[:privates], teamexhibitions: params[:teams],
                    artfairs: params[:fairs], possessions: params[:possessions], etc: params[:etc])
        redirect_to '/'
    end
    
end
