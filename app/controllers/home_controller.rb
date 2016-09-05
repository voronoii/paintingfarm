class HomeController < ApplicationController
  def index
    @recommends = Market.order("RANDOM()").limit(8)
    @recents = Market.all.order('created_at DESC').take(8)
    
    @market_count = Market.all.count
    @artist_count = Artist.all.count
    
  end
end
