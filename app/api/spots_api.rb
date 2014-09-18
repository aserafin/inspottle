class SpotsAPI < Base
  resource :spots do
    desc 'list all available spots'

    get '/' do
      Spot.order('name ASC').to_a
    end
  end
end
