class Spot < ActiveRecord::Base

  has_many :spot_activities, dependent: :destroy
  has_many :activities, through: :spot_activities

  has_many :available_events, -> { where('starts_at >= ?', Time.zone.now - 30.minutes) }, class_name: 'Event'
  has_many :events

  belongs_to :creator, class_name: 'User'

  validates :name, presence: true

  scope :by_activity, -> (activity_id) { includes(:activities).references(:activities).where(activities: { id:  activity_id}) }

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address1  = geo.street_address
      obj.city      = geo.city
      obj.post_code = geo.postal_code
      obj.country   = geo.country_code
    end
  end

  after_validation :geocode, :reverse_geocode

  def address
    [address1, address2, post_code, city, country].compact.join(',')
  end

end
