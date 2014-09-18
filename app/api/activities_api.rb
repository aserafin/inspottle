class ActivitiesAPI < Base
  resource :activities do
    desc 'list all activities'

    get '/' do
      Activity.order('name ASC')
    end
  end
end
