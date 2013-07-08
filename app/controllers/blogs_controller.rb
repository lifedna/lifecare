class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    if Blog.create params[:blog]
      redirect_to :action => "index"
    else
      render "new"  
    end  
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
