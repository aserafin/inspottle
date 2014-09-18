class FacebookService
  def initialize(user, token)
    @user = user
    @token = token
  end

  def update_information
    @facebook_user = verify!

    @user.name = @facebook_user['name']
    @user.email = @facebook_user['email']
    @user.facebook_token = @token
  end

  private
  def verify!
    facebook_user = Koala::Facebook::API.new(@token).get_object('me')
    raise Koala::Facebook::AuthenticationError if facebook_user['id'] != @user.facebook_id

    facebook_user
  end
end
