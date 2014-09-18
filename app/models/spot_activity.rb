class SpotActivity < ActiveRecord::Base

  belongs_to :spot
  belongs_to :activity

  validates :spot_id, :activity_id, presence: true

end
