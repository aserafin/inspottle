class LoginService
  def initialize(facebook_id, facebook_token)
    @facebook_id = facebook_id
    @facebook_token = facebook_token
  end

  def login!
    User.where(facebook_id: @facebook_id).first_or_initialize.tap do |user|
      facebook_service = FacebookService.new(user, @facebook_token)
      facebook_service.update_information
      user.generate_auth_token

      user.save!
    end
  end
end
