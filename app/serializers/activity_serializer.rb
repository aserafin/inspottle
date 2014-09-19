class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :icon_white_url, :icon_blue_url
end