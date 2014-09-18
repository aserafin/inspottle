class Spot < ActiveRecord::Base

  has_many :spot_activities
  has_many :activities, through: :spot_activities


end
