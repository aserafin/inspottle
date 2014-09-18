class ActivitiesAPI < Base
  resource :activities do
    desc 'list all activities'

    get 'all', serializer: ActivitySerializer do
      Activity.order('name ASC')
    end
  end
end
