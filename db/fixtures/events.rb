Event.seed(:id,
  { id: 1, user_id: User.first.id, spot_id: 1, starts_at: Time.zone.now + 10.minutes, activity_id: 1 },
  { id: 2, user_id: User.first.id, spot_id: 1, starts_at: Time.zone.now - 2.hours, activity_id: 1 },
  { id: 3, user_id: User.first.id, spot_id: 1, starts_at: Time.zone.now - 2.days, activity_id: 2 },
  { id: 4, user_id: User.first.id, spot_id: 2, starts_at: Time.zone.now + 15.minutes, activity_id: 2 }
)

EventUser.seed(:id,
  { id: 1, user_id: User.last.id, event_id: 1 }
)