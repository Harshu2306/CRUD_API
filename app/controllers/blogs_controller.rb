class BlogsController < ApplicationController

  def index
    res,blog = BlogService::BlogReader.new(blog_params).index
    if res
      send_response(1, 200, "Employee listing", ActiveModelSerializers::SerializableResource.new(blog))
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
    res,blog = BlogService::BlogReader.new(blog_params).show
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
    res,blog = BlogService::BlogCreator.new(blog_params).destroy
    if res
      send_response(1, 200, "Is_Delete is changed", ActiveModelSerializers::SerializableResource.new(blog))
    else
      send_response(0,404,"Something went wrong".blog.errors)
    end
  end

  private

  def blog_params
    params.permit(:id,:title,:body,:view_count,:published_Date,:is_active,:is_delete,:blog_comments)
  end
end
