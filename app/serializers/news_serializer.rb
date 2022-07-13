class NewsSerializer < ActiveModel::Serializer
  attributes :id, :news_title, :news_body, :published_date, :like_count
    
end
