class SpotsAPI < Base
  resource :spots do
    desc 'list all available spots'
    get '/', each_serializer: SpotSerializer do
      Spot.order('name ASC').to_a
    end

    desc 'create new spot'
    params do
      requires :name, type: String
      requires :activity_ids, type: Array
      optional :latitude, type: BigDecimal
      optional :longitude, type: BigDecimal
      optional :short_description, type: String
      optional :address1, type: String
      optional :address2, type: String
      optional :post_code, type: String
      optional :city, type: String
      optional :country, type: String
    end
    post '/', each_serializer: SpotSerializer do
      
    end
  end
end
