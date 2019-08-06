class HomeController < ApplicationController
  def index
    @recommends = Market.order("RANDOM()").limit(8) #추천 작품 8개
    @recents = Market.all.order('created_at DESC').take(8) #최신 작품 8개
    
    @market_count = Market.all.count #작품수 카운트
    @artist_count = Artist.all.count #작가수 카운트
    
  end
  
  def email_send #문의 이메일 보내기
    sender = params[:sender]
    email = params[:email]
    message = params[:message]
    
    #mailers 폴더 - contact_gallery.rb에서 메일 처리, mailgun gem이용
    ContactGallery.send_email2(sender, email, message).deliver_now
    flash[:notice] = "문의내용이 접수되었습니다!"
    redirect_to :back
  end
end
