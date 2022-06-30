class BlogsController < ApplicationController

  def index
    blog=Blog.where(is_active: true).where(is_delete: false)
    send_response(1, 200, "Employee listing", ActiveModelSerializers::SerializableResource.new(blog))
  end

  def create
    if params[:title].present? && params[:body].present? && params[:view_count].present? && params[:published_Date].present?

      blog = Blog.new(blog_params)
      if blog.save
      send_response(1, 200, "Creating Blog", ActiveModelSerializers::SerializableResource.new(blog) )
      else
        send_response(0, 404, "Filled the require field properly", blog.errors)
      end

    else
       send_response(0, 404, "Parameter Missing", {})
     end
  end

  def show
    blog = Blog.find(params[:id])
    send_response(1, 200, "Blog details", ActiveModelSerializers::SerializableResource.new(blog))
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update
      send_response(1, 200, "Updating Blog", ActiveModelSerializers::SerializableResource.new(blog) )
    else
      send_response(0,404,"Something went wrong",blog.errors)
    end
  end

  def destroy
    blog=Blog.find(params[:id])
    blog.update(is_delete: true)
    send_response(1, 200, "Is_Delete is changed", ActiveModelSerializers::SerializableResource.new(blog))
  end

  private

  def blog_params
    params.permit(:title,:body,:view_count,:published_Date,:is_active,:is_delete)
  end
end
