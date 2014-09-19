class Resources::ActivitiesAPI < Base
  resource :activities do
    desc 'list all activities'

    get '/' do
      Activity.order('position asc')
    end
  end
end
