# WillPaginate.per_page = 20 #페이지네이션
class Market < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    mount_uploader :image, ImageUploader
    
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

    def crop_market
      image.recreate_versions! if crop_x.present?
    end    
end
