class MypageController < ApplicationController
    
    def new
    end
    
    
    def create
        Profile.create(artistid: params[:artistid], academic: params[:academic], awards: params[:awards], privateexhibitions: params[:privates], teamexhibitions: params[:teams],
                    artfairs: params[:fairs], possessions: params[:possessions], etc: params[:etc])
        
        
        redirect_to '/'
    end
    


    
end
