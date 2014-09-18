class Spot < ActiveRecord::Base

  has_many :spot_activities, dependent: :destroy
  has_many :activities, through: :spot_activities


end
