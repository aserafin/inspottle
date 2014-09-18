class Base < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response e.to_json, 404
  end

  rescue_from Koala::Facebook::AuthenticationError do |e|
    rack_response e.to_json, 500
  end

  rescue_from :all do |e|
    puts "#{e.message}\n\n#{e.backtrace.join("\n")}"
  end

  mount UsersAPI

  add_swagger_documentation
end
