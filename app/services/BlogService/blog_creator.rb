module BlogService
  class BlogCreator < ApplicationService
    def initialize(params)
      @params = params
    end

    def create
      blog = Blog.new(blog_params)
      blog.image.attach(blog_params[:image])
      if blog.save
        return true,blog
      else
        return false,blog
      end
    end

    def update
      blog = Blog.find(blog_params[:id])
      if blog.update(blog_params)
        return true,blog
      else
        return false,blog    
      end
    end

    def destroy
      blog=Blog.find(@params[:id])
      blog.update(is_delete: true)

      if blog.is_delete == true
        return true,blog
      else
        return false,blog
      end
    end

    private
    def blog_params
      @params.permit(:id,:title,:body,:view_count,:published_date,:blog_comments,:image,:blog_count)
    end
  end
end