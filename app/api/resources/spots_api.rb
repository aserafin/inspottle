class Resources::SpotsAPI < Base
  resource :spots do
    desc 'list all available spots'
    get '/', each_serializer: SpotSerializer do
      Spot.order('name ASC').to_a
    end

    desc 'create new spot'
    params do
      requires :auth_token, type: String
      requires :spot, type: Hash do
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
    end
    post '/', each_serializer: SpotSerializer do
      authenticate!
      Spot.new(declared(params, include_missing: false)[:spot].merge(creator_id: current_user.id)).tap(&:save!)
    end

    desc 'edit existing spot'
    params do
      requires :auth_token, type: String
      requires :spot, type: Hash do
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
    end
    put ':id', each_serializer: SpotSerializer do
      authenticate!

      Spot.where(id: params[:id]).first!.tap do |spot|
        raise Exceptions::PermissionError if spot.creator_id.nil? || spot.creator_id != current_user.id
        spot.update_attributes!(declared(params, include_missing: false)[:spot])
      end
    end
  end
end
