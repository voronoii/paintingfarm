class TinymceAssetsController < ApplicationController
    
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
