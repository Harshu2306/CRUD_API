class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:username,:phone,:email,:password,:is_active,:is_delete
end
