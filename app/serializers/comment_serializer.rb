class CommentSerializer < ActiveModel::Serializer
  attributes :id, :blog_id, :comment_title, :comment_text, :blog_comments, :comments_blog

  def blog_comments
    self.active_comments
  end

  def comments_blog
    self.blog
  end
end
