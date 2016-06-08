class HomeController < ApplicationController
  def index
    @recommends = Market.order("RANDOM()").limit(8)
  end
end
