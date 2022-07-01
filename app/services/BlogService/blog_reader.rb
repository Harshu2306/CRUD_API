module BlogService
  class BlogReader < ApplicationService
    def initialize(params)
      @params = params
    end

    def index
      if blog = Blog.where(is_active: true).where(is_delete: false).active_post
        return true,blog
      else
        return false,blog
      end
    end

    def show
      blog = Blog.find(blog_params[:id])
      return true,blog
    end

    private
    def blog_params
      @params.permit(:id,:title,:body,:view_count,:published_Date,:is_active,:is_delete,:blog_comments)
    end
  end
end