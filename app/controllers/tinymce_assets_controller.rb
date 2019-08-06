class TinymceAssetsController < ApplicationController
    #글 편집기에서 이미지 업로드를 위한 코드 
    def create
        i = PostImage.new
        i.image_url = params[:file]
        
        if i.save
            render json: {
              image: {
                url: i.image_url.url
              }
            }, content_type: "text/html"
        end
    
    end
    
end
