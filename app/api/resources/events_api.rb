class Resources::EventsAPI < Base
  resource :events do
    desc 'list all upcoming event'
    get '/' do
      Event.upcoming
    end

    desc 'list all recent event'
    get '/recent' do
      Event.recent
    end

    desc 'create new event'
    params do
      requires :auth_token, type: String
      requires :event, type: Hash do
        requires :spot_id, type: Integer
        requires :activity_id, type: Integer


        optional :starts_at, type: DateTime
      end
    end
    post '/', each_serializer: SpotSerializer do
      authenticate!
      Event.new(declared(params, include_missing: false)[:event].merge(user_id: current_user.id)).tap(&:save!)
    end
  end
end
