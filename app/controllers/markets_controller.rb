class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #사용자 체크
  def index #작품 모두 보여주기
    @markets = Market.paginate(:page => params[:page])
    
    #최신작품
    @recents = Market.all.order('created_at DESC').take(3)
    
    #추천작품
    @recommends = Market.order("RANDOM()").limit(3)

    
  end
  
  def show #작품상세페이지
    @market = Market.find(params[:id])
  end
  
  def new #작품등록 폼
  end
  
  def create #작품등록
  #render text:params
  #아티스트에, 해당 user_id가 없으면 생성 아니면 기존 정보 이용
  if Artist.find_by(user_id: params[:artist]).nil?
    a = Artist.create(user_id: params[:artist])  
  else a = Artist.find_by(user_id: params[:artist])
  end
  
  Market.create(title: params[:title], price: params[:price], size: params[:size],
                genre: params[:genre], year: params[:year], material: params[:material], 
                content: params[:content], artist_id: a.id, image: params[:image])
                            
  
  redirect_to "/markets/index"
  end
end
