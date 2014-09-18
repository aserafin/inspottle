class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :facebook_id, presence: true, uniqueness: true
  validates :facebook_token, presence: true, uniqueness: true

  def self.authorize!(auth_token)
    User.where(auth_token: auth_token).first!
  end

  def generate_auth_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(auth_token: random_token)
    end
  end
end
