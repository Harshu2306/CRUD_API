class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_date, :is_active, :is_delete, :view_count, :blog_comments, :image_url, :blog_count   

  def blog_comments
    object.comments.active_comments
  end

  def image_url
    object.image_url
  end
end
