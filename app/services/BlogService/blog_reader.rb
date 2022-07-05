module BlogService
  class BlogReader < ApplicationService
    def initialize(params)
      @params = params
    end

    def index
      if blog = Blog.where(is_active: true).active_post.proper_date
        return true,blog
      else
        return false,blog
      end
    end

    def show
      blog = Blog.find(@params[:id])
      blog.increment!(:blog_count)
      return true,blog
    end
  end
end