class PostsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.order(sort_column + ' ' + sort_direction)
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
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
  
  def delete
    @post = Post.find(params[:id]).destroy
    redirect_to @post
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
    Post.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  private
  def post_params
    params.require(:post).permit(:name, :format, :length, :size)
  end
  
end
