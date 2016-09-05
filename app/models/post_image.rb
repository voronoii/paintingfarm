class PostImage < ActiveRecord::Base
    mount_uploader :image_url, TinymceImageUploader
end
