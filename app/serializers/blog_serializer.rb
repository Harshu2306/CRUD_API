class BlogSerializer < ActiveModel::Serializer
  attributes :id,:title,:body,:published_Date,:is_active,:is_delete,:view_count,:blog_comments

  def blog_comments
    object.comments.active_comments
  end
end
