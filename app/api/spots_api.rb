class SpotsAPI < Base
  resource :spots do
    desc 'list all available spots'

    get 'all', serializer: SpotSerializer do
      Spot.order('name ASC')
    end
  end
end
