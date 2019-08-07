class MypageController < ApplicationController
    
    def index
        @artist = current_user
       
        # 작품수counts, 작품arts
        if Artist.find_by user_id: current_user.id
            @counts = Market.where("artist_id = ?", @artist.artist).count
            @arts = Market.where(artist_id: @artist.artist)
        else
            @counts = 0
            @arts = nil
        end
            
    end
    
    def new
    end
    
    # 뷰인어룸 배경 이미지 등록
    def create
        u = User.find_by(id: params[:user_id])
          u.update(room: params[:image]) 
         flash[:notice] = "사진이 등록되었습니다!"
         redirect_to :back       
    end
    
    # 닉네임, 비밀번호 수정
    def update
        if User.find_by(nickname: params[:newnick]).present?
            flash[:notice] = "이미 존재하는 닉네임입니다"
            redirect_to '/mypage'
        else
            n = User.find(params[:id])
            n.update(nickname: params[:newnick])
            n.save
            flash[:notice] = "닉네임이 수정되었습니다!"
            redirect_to '/mypage'
        end
    end
    
    def delete
    end
    
    
    
    def artist_profile
    end
    
    # 작가 이력 등록
    def artist_profile_create
        Profile.create(artistid: params[:artistid], academic: params[:academic], awards: params[:awards], privateexhibitions: params[:privates], teamexhibitions: params[:teams],
                    artfairs: params[:fairs], possessions: params[:possessions], etc: params[:etc])
        redirect_to '/'
    end
    
end
