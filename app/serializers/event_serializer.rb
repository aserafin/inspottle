class EventSerializer < ActiveModel::Serializer
  attributes :id
  attributes :event_type
  attributes :starts_at

  has_one :user
  has_one :activity
  has_many :users

  def starts_at
    object.starts_at.try(:iso8601)
  end
end