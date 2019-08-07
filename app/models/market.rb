# WillPaginate.per_page = 20 #페이지네이션
class Market < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    #carrierWave gem과 관련된 이미지 업로드 코드
    mount_uploader :image, ImageUploader
    
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    
    #이미지 crop 코드
    def crop_market
      image.recreate_versions! if crop_x.present?
    end    
end
