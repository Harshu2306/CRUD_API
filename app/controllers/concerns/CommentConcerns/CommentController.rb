module CommentConcerns
  module CommentController
    extend ActiveSupport::Concern

      def index
        if comment = Comment.where(is_delete: false)
          send_response(1, 200, "Comment listing", ActiveModelSerializers::SerializableResource.new(comment))
        else
          send_response(1, 200, "Comment is deleted",{})
        end
      end

      def create
        comment = Comment.new(comment_params)
        if comment.save
          send_response(1, 200, "Comment is created", ActiveModelSerializers::SerializableResource.new(comment))
        else
          send_response(1, 200, "Something went wrong",comment.errors)
        end

      end

      def update
        comment = Comment.find(comment_params[:id])
        if comment.update(comment_params)
          send_response(1, 200, "Comment is updated", ActiveModelSerializers::SerializableResource.new(comment))
        else
          send_response(1, 200, "Something went wrong", comment.errors)
        end
      end

      def show
        comment = Comment.find(params[:id])
        send_response(1, 200, "Your commet is : ", ActiveModelSerializers::SerializableResource.new(comment))
      end

      def destroy
        comment = Comment.find(params[:id])
        if comment.present?
        comment.destroy 
        send_response(1, 200, "Comment is deleted",{})
        else
          send_response(1, 404, "Comment does not exists",{})
        end
      end

      def comment_with_blog
          bblog = Blog.find_by(title: params[:title])
          if bblog.present?
            comment = bblog.comments.new(comment_params)
            if comment.save
              send_response(1, 200, "Comment is created", ActiveModelSerializers::SerializableResource.new(comment))
            else
              send_response(1, 200, "Something went wrong",{})
            end

          else
            blog = Blog.new(blog_params)
            blog.image.attach(blog_params[:image])
              if blog.save
                #send_response(1, 200, "Blog Created", ActiveModelSerializers::SerializableResource.new(blog))
              #else
                #send_response(0,404,"Something went wrong",{})
              #end
              comment = blog.comments.new(comment_params)
              if comment.save
                return comment
              else
                send_response(1, 200, "Something went wrong",{})
              end
              send_response(1, 200, "Blog Created", ActiveModelSerializers::SerializableResource.new(blog))

            else
              send_response(1,200,"something went wrong",{})
            end
          end 
      end



      def solution
        blog = Blog.find_by(title: params[:title])
        if blog.present?
          comment = blog.comments.new(comment_params)
          if comment.save
              send_response(1, 200, "Comment is created", ActiveModelSerializers::SerializableResource.new(blog))
            else
              send_response(1, 200, "Something went wrong",{})
            end

        else
          blog = Blog.new(blog_params)
          if blog.save
            comment = blog.comments.new(comment_params)
            if comment.save
              send_response(1, 200, "Blog Created with your comment", ActiveModelSerializers::SerializableResource.new(blog))
            else
              send_response(1, 200, "Something went wrong",{})
            end
          else
            send_response(1, 200, "Something went wrong",{})
          end
        end
      end

      def nested_attribute
        blog = Blog.find_or_create_by(blog_params)
          if blog.present?
           if comment = blog.comments.new(comment_params)
              send_response(1, 200, "Comment is created", ActiveModelSerializers::SerializableResource.new(blog))
            else
                send_response(1, 200, "Something went wrong",{})
            end

        else
          blog = Blog.new(blog_params)
          if blog.save
            if comment = blog.comments.new(comment_params)
              send_response(1, 200, "Blog Created with your comment", ActiveModelSerializers::SerializableResource.new(blog))
            else
              send_response(1, 200, "Something went wrong",{})
            end
          else
            send_response(1, 200, "Something went wrong",{})
          end
        end
      end

        private 
        def comment_params
          params.permit(:id, :blog_id, :comment_title, :comment_text)
        end
  end
end