class CommentSerializer < ActiveModel::Serializer
  attributes :id,:blog_id,:comment_title,:comment_text,:blog_comments
  belongs_to :blog

  def blog_comments
    comments.active_comments
  end
end
