class HomeController < ApplicationController
  def index
    @recommends = Market.order("RANDOM()").limit(8)
    @recents = Market.all.order('created_at DESC').take(8)
    
    @market_count = Market.all.count
    @artist_count = Artist.all.count
    
  end
  
  def email_send #문의 이메일 보내기
    sender = params[:sender]
    email = params[:email]
    message = params[:message]
    
    
    ContactGallery.send_email2(sender, email, message).deliver_now
    flash[:notice] = "문의내용이 접수되었습니다!"
    redirect_to :back
  end
end
