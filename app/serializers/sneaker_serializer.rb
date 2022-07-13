class SneakerSerializer < ActiveModel::Serializer
  attributes :id, :sneaker_name, :company, :price, :size, :user_id, :username

  def username
    object.user.username
  end
end
