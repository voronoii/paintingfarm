WillPaginate.per_page = 12
class Market < ActiveRecord::Base
    belongs_to :artist
    mount_uploader :image, ImageUploader
end
