class Event < ActiveRecord::Base

  belongs_to :activity
  belongs_to :spot
  belongs_to :user

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users

  scope :upcoming, -> { where(['starts_at >= ?', Time.now - 1.hour]) }
  scope :recent, -> { where(['starts_at < ?', Time.now - 1.hour]) }

  validates :activity_id, :spot_id, :user_id, :starts_at, presence: true

  before_validation :check_starts_at

  def event_type
    return 'future'   if starts_at > Time.zone.now + 30.minutes
    return 'current'  if starts_at >= Time.zone.now - 30.minutes && starts_at < Time.zone.now + 30.minutes
    return 'old'
  end

  private

  def check_starts_at
    self.starts_at ||= Time.zone.now
  end
end
