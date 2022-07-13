class BlogsController < ApplicationController

  def index
    res,blogs = BlogService::BlogReader.new(params).index
    if res
      page_no = params[:page].present? ? params[:page] : DEFAULT_PAGE
      per_page = params[:per_page].present? ? params[:per_page] : PER_PAGE_RECORDS
      meta = prepare_meta(blogs, total_record_count: blogs.count, page_no: page_no, per_page: per_page)
      send_response(1, 200, "Blog listing", ActiveModelSerializers::SerializableResource.new(blogs), meta)
    else
      send_response(0,404,"Something went wrong",blog.errors)
    end
  end

  def create
    res,blog = BlogService::BlogCreator.new(blog_params).create
    if res
      send_response(1, 200, "Blog Created", ActiveModelSerializers::SerializableResource.new(blog))
    else
      send_response(0,404,"Something went wrong",blog.errors)
    end
  end

  def show
    res,blog = BlogService::BlogReader.new(params).show
    if res
      send_response(1, 200, "Blog details", ActiveModelSerializers::SerializableResource.new(blog))
    else
      send_response(0,404,"Something went wrong",blog.errors)
    end
  end

  def update
    res,blog = BlogService::BlogCreator.new(blog_params).update
    if res
      send_response(1, 200, "Updating Blog", ActiveModelSerializers::SerializableResource.new(blog) )
    else
      send_response(0,404,"Something went wrong",blog.errors)
    end
  end

  def destroy
    res,blog = BlogService::BlogCreator.new().destroy
    if res
      send_response(1, 200, "Is_Delete is changed", ActiveModelSerializers::SerializableResource.new(blog))
    else
      send_response(0,404,"Something went wrong".blog.errors)
    end
  end

  def add_like
    blog = Blog.find_by(id: params[:id])
    blog.increment!(:like_count)
    blog.save
    send_response(0, 200, "Like_Count is incrementend By 1", ActiveModelSerializers::SerializableResource.new(blog))
  end


    private
    def blog_params
      params.fetch(:blog,{}).permit(:id, :title, :body, :view_count, like_count, comments_attributes: [ :id, :blog_id, :comment_title, :comment_text ])
    end
end
