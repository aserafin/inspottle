class Event < ActiveRecord::Base

  belongs_to :activity
  belongs_to :spot
  belongs_to :user

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users

  validates :activity_id, :spot_id, :user_id, presence: true


end
