class Activity < ActiveRecord::Base

  has_many :spot_activities, dependent: :destroy
  has_many :spots, through: :spot_activities

  has_attached_file :icon_white
  has_attached_file :icon_blue

  validates :name, presence: true
  validates_attachment_content_type :icon_white, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :icon_blue, :content_type => /\Aimage\/.*\Z/

  def icon_white_url
    icon_white.url
  end

  def icon_blue_url
    icon_blue.url
  end
end
