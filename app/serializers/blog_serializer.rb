class BlogSerializer < ActiveModel::Serializer
  attributes :id,:title,:body,:published_Date,:is_active,:is_delete
end
