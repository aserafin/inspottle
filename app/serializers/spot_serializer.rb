class SpotSerializer < ActiveModel::Serializer

  attributes :id, :name, :latitude, :longitude, :short_description, :address1, :address2, :post_code, :city, :country

end
