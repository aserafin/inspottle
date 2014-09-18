class ActivitiesAPI < Base
  resource :activities do
    desc 'list all activities'

    get '/' do
      Activity.order('name ASC').to_a
    end
  end
end
