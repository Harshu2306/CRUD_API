module BlogService
  class BlogCreator < ApplicationService
    def initialize(params)
      @params = params
    end

    def create
      if @params[:title].present? && @params[:body].present?
        blog = Blog.new(blog_params)
        if blog.save
          return true,blog
        else
          return false,blog
        end
      end
    end

    def update
      blog = Blog.find_by(id: @params[:id])
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
      @params.permit(:id, :title, :body, :view_count, :like_count, comments_attributes: [ :id, :blog_id, :comment_title, :comment_text ])
    end
  end
end