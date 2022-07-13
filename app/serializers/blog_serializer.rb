class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :view_count, :like_count, :is_active, :is_delete, :blog_count, :blog_comments
  def blog_comments
    object.comments
  end
end
