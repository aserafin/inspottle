class SpotSerializer < ActiveModel::Serializer

  attributes :id, :name, :latitude, :longitude, :short_description, :address1, :address2, :post_code, :city, :country, :creator_id
  attributes :distance

  has_many :events, each_serializer: EventSerializer

  def distance
    object.try(:distance)
  end
end
