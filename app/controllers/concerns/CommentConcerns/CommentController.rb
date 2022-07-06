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
          send_response(1, 200, "Comment is creatd", ActiveModelSerializers::SerializableResource.new(comment))
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

      private 

      def comment_params
        params.permit(:blog_id,:comment_title,:comment_text)
      end
  end
end