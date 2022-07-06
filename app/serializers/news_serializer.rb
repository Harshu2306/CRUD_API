class NewsSerializer < ActiveModel::Serializer
  attributes :id,:title,:body,:published_date,:news_count,:image_url,:like_count

    def image_url
      object.image_url
    end

    def like_count
      if object.like.present?
        object.like.like_count
      else
        0
      end
    end
    
end
