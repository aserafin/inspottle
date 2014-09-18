class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :email
  attributes :auth_token
end