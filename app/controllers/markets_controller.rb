class MarketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #사용자 체크
 
  def index #작품 모두 보여주기
    
    #최신작품
    @recents = Market.all.order('markets.created_at DESC').take(3)
    
    #추천작품
    @recommends = Market.order("RANDOM()").limit(3)
    
    #기간별, 너비별, 높이별, 제작년도, 장르에 따라 동적으로 작품이 보여지기 위한 query작성
      db_query = "markets.title is not NULL";
      db_order = "markets.created_at DESC";
      
      price_from = params["price_from"] || 0
      price_to = params["price_to"] || 1000000000
      db_query += " AND (markets.price between " + price_from.to_s + " AND " + price_to.to_s + ")";
      
      width_from = params["width_from"] || 0
      width_to = params["width_to"] || 1000000
      db_query += " AND (markets.width between " + width_from.to_s + " AND " + width_to.to_s + ")";
      
      height_from = params["height_from"] || 0
      height_to = params["height_to"] || 1000000
      db_query += " AND (markets.height between " + height_from.to_s + " AND " + height_to.to_s + ")";
      
      
      if params["period"]
        db_query = db_query + " AND markets.year BETWEEN " + params["period"] + " AND " + (params["period"] + 9);
      end
      if params["sort"]
        puts case params["sort"]
        when "new"
          db_order = "markets.created_at DESC"
        when "low_price"
          db_order = "markets.price ASC"
        when "high_price"
          db_order = "markets.price DESC"
        end
      end
      if params["theme"]
        db_query += " AND markets.genre_id = " + params["theme"];
      end
      if params["year"]
          db_query = db_query + " AND (markets.year is NULL "
          for from_year in params["year"]
            if from_year == "1970_under"
              db_query += (" OR markets.year < 1970")
            else
              to_year = from_year.to_i + 9
              db_query += (" OR markets.year between #{from_year} and #{to_year}")
            end
          end
          db_query += ")"
        
      end
      
      if params[:search]
        #imsi = Market.where("title LIKE :s OR content LIKE :s", {s: "%#{params[:search]}%"})
        #imsi = Market.joins().where("markets.title LIKE :s OR markets.content LIKE :s OR users.nickname LIKE :s", {s: "%#{params[:search]}%"})
        db_query += " AND (markets.title LIKE :s OR markets.content LIKE :s OR users.nickname LIKE :s)"
        print "gogo search!"
        print db_query
        @markets = Market.joins("left join users on markets.artist_id = users.id").all.where(db_query, {s: "%#{params[:search]}%"}).order(db_order).paginate(:page => params[:page], per_page: 12)
        
      else
        print "gogo list!"
        print db_query
        #한페이지에 12개씩 보여주며, 이후건에 대해서는 스크롤을 내리면 로딩됨(index.js.erb코드) 
        @markets = Market.all.where(db_query).order(db_order).paginate(:page => params[:page], per_page: 12)
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
    
    #작가 이름 
    @artist = Artist.find(@market.artist)
    #작가 프로필
    #@profile = Profile.find_by(artistid: @market.artist.id)
    #artist와 user아이디의 불일치로 생기는 문제로 인해 잠시 변경
    @profile = Profile.find_by(artistid: @market.artist.user_id)
    unless @profile.nil? #프로필 내용이 있다면 split해서 뿌려줌
      @academics = @profile.academic.split(/\r\n/)
      @awards = @profile.awards.split(/\r\n/)
      @privates = @profile.privateexhibitions.split(/\r\n/)
      @teams = @profile.teamexhibitions.split(/\r\n/)
      @fairs = @profile.artfairs.split(/\r\n/)
      @possessions = @profile.possessions.split(/\r\n/)
      @etc = @profile.etc.split(/\r\n/)
    else #프로필 내용이 없다면 미등록으로 보여줌
      @academics = ['미','등','록']
      @awards = ['미','등','록']
      @privates = ['미','등','록']
      @teams = ['미','등','록']
      @fairs = ['미','등','록']
      @possessions = ['미','등','록']
      @etc = ['미','등','록']
    end
  end
  
  def new #작품등록 폼(뷰만 있음)
  end
  
  def create #작품등록 프로세스
    # render text:params
    #아티스트에, 해당 user_id가 없으면 생성 아니면 기존 정보 이용
    if Artist.find_by(user_id: params[:artist]).nil?
      a = Artist.create(user_id: params[:artist])  
    else a = Artist.find_by(user_id: params[:artist])
    end

    #db생성
    @market = Market.create(title: params[:title], price: params[:price], width: params[:width], height: params[:height],
                  genre_id: params[:genre], year: params[:year], material: params[:material], content: params[:content], artist_id: a.id, image: params[:image])
    
    #안내문구 띄우기
    flash[:notice] = "작품이 등록되었습니다!"
    redirect_to "/markets"            
  end
  
  def delete #삭제하기
    m = Market.find(params[:id])
    if m.destroy #테이블삭제
      m.remove_image! #이미지파일삭제
    end
    flash[:notice] = "작품이 삭제되었습니다!"    
    redirect_to '/markets'
  end
  
  def edit #수정하기 폼
    @market = Market.find(params[:id])
    @genres = Genre.all
  end
  
  def update #수정하기
    m = Market.find(params[:id])
            
    m.update(title: params[:title], price: params[:price], width: params[:width], height: params[:height],
                  genre_id: params[:genre], year: params[:year], material: params[:material], content: params[:content], image: params[:image])           
    flash[:notice] = "작품이 수정되었습니다!"
    redirect_to "/markets/show/#{m.id}"
  end

  
  def view_in_a_room #이미지 상세보기
    market = Market.find(params[:id]) # DB에서 가져오기
    @market_img_url = market.image # 이미지 경로 (image는 marketDB에서 이미지 경로 칼럼 이름이다)
    @market_img_width = market.width # 이미지 width
    @market_img_height = market.height # 이미지 height
    
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
    
    #mailers폴더 - contact_gallery.rb에서 처리
    ContactGallery.send_email(sender, email, message, m_id, m_title, m_artist).deliver_now
    redirect_to :back
  end
  
end
