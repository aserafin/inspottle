class Activity < ActiveRecord::Base

  has_many :spot_activities, dependent: :destroy
  has_many :spots, through: :spot_activities

  has_attached_file :icon, :styles => { :medium => '300x300>' }, :default_url => '/images/:style/missing.png'

  validates :name, presence: true
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  def icon_url
    icon.url
  end

end
