class BoardsController < ApplicationController
    def index
        @notices = Notice.all.order('created_at DESC')
    
    end
    
    
    def index_backup #유내가 만든 원래 버전
        if params[:search]
            imsi_posts = Board.where("writer LIKE :s OR title LIKE :s OR content LIKE :s", {s: "%#{params[:search]}%"})
            @posts = imsi_posts.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
        else
            @posts = Board.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
        end
        
        @comments_size = Comment.group(:p_id).distinct.count #결과값은 hash type
        @comments = Comment.all
        
        @todays = Board.where("strftime('%y/%m/%d', created_at) = ?", Time.now.strftime('%y/%m/%d')).count
        @total = Board.all.count
        
        @notices = Notice.all
    end
    
    
    
    def new
    end
    
    
    
    def create
        post = Board.new
        post.title = params[:title]
        post.content = params[:content]
        post.writer = params[:writer]
        post.writer_id = params[:writer_id]
        post.save
        redirect_to '/events'
    end
    
    
    
    def edit
        @post = Board.find(params[:id])
    end
    
    
    
    def update
        post = Board.find(params[:id])
        post.title = params[:title]
        post.content = params[:content]
        post.save
        redirect_to '/events/index'
    end
    
    
    
    def delete
        post = Board.find(params[:id])
        post.destroy
        redirect_to '/events'
    end



    def show
        # 지금은 무조건 +1 하지만 다음엔 각 사용자마다 1씩만 카운팅하는 조건 추가
        
        posting = Board.find(params[:id])
        posting.views += 1
        posting.save
        @post = Board.find(params[:id])
        @comments = Comment.where("p_id=?", params[:id])
    end
    
    
    
    def comment
        reply = Comment.new
        reply.p_id = params[:p_id]
        reply.user_name = params[:c_writer]
        reply.user_id = params[:c_writer_id]
        reply.pwd = params[:c_pwd]
        reply.content = params[:c_content]
        reply.save
        
        redirect_to :back
    end
    
    
    
    def notice
    end
    
    def create_notice
        notice = Notice.new
        notice.title = params[:title]
        notice.content = params[:content]
        notice.writer = params[:admin_id]
        notice.save
        redirect_to '/boards'
    end
    
    def show_notice
        # 지금은 무조건 +1 하지만 다음엔 각 사용자마다 1씩만 카운팅하는 조건 추가
        posting = Notice.find(params[:id])
        posting.views += 1
        posting.save
        @notice = Notice.find(params[:id])
        @comments = Comment.where("p_id=?", params[:id])
    end
    
    
    def edit_notice
        @post = Notice.find(params[:id])
    end
    
    
    
    def update_notice
        post = Notice.find(params[:id])
        post.title = params[:title]
        post.content = params[:content]
        post.save
        redirect_to '/boards'
    end
    
    
    
    def delete_notice
        post = Notice.find(params[:id])
        post.destroy
        redirect_to '/boards'
    end
    
    
end
