class SpotsRepository
  def self.fetch(latitude, longitude, distance, pagination_options = {})
    pagination_options[:page] ||= 0
    pagination_options[:per_page] ||= 20
    distance ||= 10

    spots = Spot.includes(:activities, events: [:user, :activity, :users])
    spots = spots.limit(pagination_options[:per_page]).offset(pagination_options[:per_page] * pagination_options[:page])
    spots = spots.joins('left join (select max(starts_at) as starts_at, spot_id from events group by spot_id) as spot_events on (spots.id = spot_events.spot_id)')
    if location_present?(latitude, longitude)
      spots = spots.near([latitude, longitude], distance, units: :km)
      spots = spots.order('spot_events.starts_at desc nulls last, distance asc nulls last, spots.id asc')
    else
      spots = spots.order('spot_events.starts_at desc nulls last, spots.id asc')
    end
    spots
  end

  private
  def self.location_present?(latitude, longitude)
    latitude.present? && longitude.present?
  end
end