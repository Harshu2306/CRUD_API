class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:username,:phone,:email
end
