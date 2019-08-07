class PostImage < ActiveRecord::Base
    #공지사항 이미지업로드
    mount_uploader :image_url, TinymceImageUploader
end
