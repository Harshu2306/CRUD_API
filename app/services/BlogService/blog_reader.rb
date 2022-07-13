module BlogService
  class BlogReader < ApplicationService
    def initialize(params)
      @params = params
    end

    def index
      if blogs = Blog.where(is_active: true).active_post.proper_date
        blogs = blogs.paginate(page: @params[:page], per_page: 3)
        page_no = @params[:page].present? ? @params[:page] : DEFAULT_PAGE
        per_page = @params[:per_page].present? ? @params[:per_page] : PER_PAGE_RECORDS
        return true,blogs
      else
        return false,blogs
      end
    end

    def show
      blog = Blog.find(@params[:id])
      blog.increment!(:blog_count)

      if blog.like.present?
        blog.like.increment!(:like_count)
      else
        blog.like = Like.new(like_count: 1)
        blog.like.save
      end
      return true,blog
    end
  end
end