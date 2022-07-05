class CommentSerializer < ActiveModel::Serializer
  attributes :id,:blog_id,:comment_title,:comment_text,:blog_comments

  def blog_comments
    self.active_comments
  end
end
