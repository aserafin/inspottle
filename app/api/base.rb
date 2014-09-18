class Base < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  rescue_from ActiveRecord::RecordInvalid do |e|
    rack_response e.record.errors.to_json, 422
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response e.to_json, 404
  end

  rescue_from Koala::Facebook::AuthenticationError do |e|
    rack_response e.to_json, 500
  end

  rescue_from :all do |e|
    puts "#{e.message}\n\n#{e.backtrace.join("\n")}"
  end

  helpers do
    def current_user
      @current_user ||= User.authorize!(params[:auth_token])
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount Resources::UsersAPI
  mount Resources::ActivitiesAPI
  mount Resources::SpotsAPI

  add_swagger_documentation(
      base_path: "/api",
      hide_documentation_path: true
  )
end
