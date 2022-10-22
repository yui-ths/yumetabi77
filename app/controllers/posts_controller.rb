class PostsController < ApplicationController
  
    before_action :authenticate_user!, except: [:index, :show, :top, :random, :random2]
    def top
    end

    def index
      if params[:search] == nil
          @posts= Post.all
      elsif params[:search] == ''
          @posts= Post.all
      else
          @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
      end
  end
  
    def random
      @random = Post.order("RANDOM()").limit(1)
    end
  
    def new
      @post = Post.new
    end
  
    def create
      post = Post.new(post_params)
  
      post.user_id = current_user.id
      
      if post.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end
  
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
    end
  
    def edit
      @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to new_post_path
      end
    end
  
    def update
      @post = Post.find(params[:id])
      if post.user != current_user
        redirect_to :new_post_path
      else
        if @post.update(post_params)
        redirect_to new_post_path
        else
          render :edit
        end
      end
    end
  
    def destroy
      @posts = Post.all
      @post = Post.find(params[:id])
      if @post.user != current_user
        redirect_to new_post_path
      else
        @post.destroy
      end
    end
  
    def random2
    end
  
    private
    def post_params
      params.require(:post).permit(:title, :image, :image2, :image3, :body, :category, :address, :longitude, :latitude, :user_id)
    end
  
  end
  