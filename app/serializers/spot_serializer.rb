class SpotSerializer < ActiveModel::Serializer

  attributes :id, :name, :latitude, :longitude, :short_description, :address1, :address2, :post_code, :city, :country, :creator_id
  attributes :distance

  has_many :available_events, each_serializer: EventSerializer, root: :events

  def distance
    object.try(:distance)
  end
end
