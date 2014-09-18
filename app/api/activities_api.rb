class ActivitiesAPI < Base
  resource :activities do
    desc 'list all activities'

    get '/', serializer: ActivitySerializer do
      Activity.order('name ASC').to_a
    end
  end
end
