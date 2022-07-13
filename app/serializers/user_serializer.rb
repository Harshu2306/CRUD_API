class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :phone, :users_sneakers
  def users_sneakers
    object.sneakers
  end


end
