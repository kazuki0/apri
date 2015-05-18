class PostsController < ApplicationController
 
  http_basic_authenticate_with name: "user", password: "secret", except: [:index, :show]

 def new
  @post = Post.new
 end

 def create
  @post = Post.new(post_params)

  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end


def show
    @post = Post.find(params[:id])
end

def index
  @posts = Post.all
 flash[:notice] = "ようこそ。本日は#{Date.today}です。"
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])

  if @post.update_attributes(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

 

 private
    def post_params
      params.require(:post).permit(:text,:title,:name, :photo)
      
    end

end
