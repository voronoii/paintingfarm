class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #사용자 체크
  def index #작품 모두 보여주기
   # @markets = Market.paginate(:page => params[:page]) #페이지네이션
    
    #최신작품
    @recents = Market.all.order('created_at DESC').take(3)
    
    #추천작품
    @recommends = Market.order("RANDOM()").limit(3)
    
    if params[:search]
        imsi = Market.where("title LIKE :s OR content LIKE :s", {s: "%#{params[:search]}%"})
      
        @markets = imsi.paginate(:page => params[:page])
    else 
        @markets = Market.all.order('created_at DESC').paginate(:page => params[:page])
    end

    
  end
  
  def show #작품상세페이지
    @market = Market.find(params[:id])
    @market_img_url = @market.image
    
    #현재 작품은 추천과 다른작품에서 제외하기 위한 코드
    current_market = Market.where.not(id: @market.id )
    
    #추천작품
    @recommends = current_market.order("RANDOM()").limit(6)
    
    #최신작품
    # @recents = Market.all.order('created_at DESC').take(8)
    
    #이 작가의 다른 작품 
    @anothers = current_market.where(artist_id: @market.artist)
    
    #작가 정보
    @artist = Artist.find(@market.artist)

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
  
  Market.create(title: params[:title], price: params[:price], width: params[:width], height: params[:height],
                genre: params[:genre], year: params[:year], material: params[:material], 
                content: params[:content], artist_id: a.id, image: params[:image])
                            
  
  redirect_to "/markets"
  end
  
  def delete #삭제하기
    m = Market.find(params[:id])
    m.remove_image! #이미지파일삭제
    m.destroy #테이블삭제
        
    redirect_to '/markets'
  end
  
  def edit #수정하기 폼
    @market = Market.find(params[:id])
  end
  
  def update #수정하기
    m = Market.find(params[:id])
    m.remove_image! #수정시에도 기존에 있던 이미지파일은 삭제
    
    m.update(title: params[:title], price: params[:price], width: params[:width], height: params[:height],
            genre: params[:genre], year: params[:year], material: params[:material], 
            content: params[:content], image: params[:image])
    m.save
    
    redirect_to "/markets/show/#{m.id}"
  end

  
  def view_in_a_room #이미지 상세보기
    market = Market.find(params[:id])
    @market_img_url = market.image #'image'는 칼럼이름이다
    @market_img_width = market.width
    @market_img_height = market.height
    
    if @market_img_width >= @market_img_height # width가 height보다 긴 경우
      case @market_img_width # 더 긴 길이를 기준으로 함
      when 0..50 then
        @img_url = "/room_img/living_room_sm.jpg" # 작은방 배경
        @view_img_width = @market_img_width * 5
        @view_img_height = @market_img_height * 5
        @person_height = 170 * 5
      when 50..100 then
        @img_url = "/room_img/living_room_md.jpg" # 중간방 배경
        @view_img_width = @market_img_width * 4
        @view_img_height = @market_img_height * 4
        @person_height = 170 * 4
      else
        @img_url = "/room_img/living_room_lg.jpg" # 큰방 배경
        @view_img_width = @market_img_width * 3
        @view_img_height = @market_img_height * 3
        @person_height = 170 * 3
      end
    else # height가 width보다 긴 경우
      case @market_img_height
      when 0..50 then
        @img_url = "/room_img/living_room_sm.jpg" # 작은방 배경
        @view_img_width = @market_img_width * 5
        @view_img_height = @market_img_height * 5
        @person_height = 170 * 5
      when 50..100 then
        @img_url = "/room_img/living_room_md.jpg" # 중간방 배경
        @view_img_width = @market_img_width * 4
        @view_img_height = @market_img_height * 4
        @person_height = 170 * 4
      else
        @img_url = "/room_img/living_room_lg.jpg" # 큰방 배경
        @view_img_width = @market_img_width * 3
        @view_img_height = @market_img_height * 3
        @person_height = 170 * 3
      end
    end
    
    render layout: false
  end
  
  def email_send #갤러리에게 이메일 보내기
    sender = params[:sender]
    email = params[:email]
    message = params[:message]
    
    m_id = params[:market_id]
    m_title = params[:market_title]
    m_artist = params[:market_artist]
    
    ContactGallery.send_email(sender, email, message, m_id, m_title, m_artist).deliver_now
    redirect_to :back
  end

  
end
