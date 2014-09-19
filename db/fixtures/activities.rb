Activity.seed(:id,
  { position: 2, id: 1, name: 'Piłka nożna', icon_white: File.open(Rails.root.join("db/icons/soccer_white.png")), icon_blue: File.open(Rails.root.join("db/icons/soccer_blue.png")) },
  { position: 3, id: 2, name: 'Koszykówka',  icon_white: File.open(Rails.root.join("db/icons/basketball_white.png")), icon_blue: File.open(Rails.root.join("db/icons/basketball_blue.png"))   },
  { position: 4, id: 3, name: 'Siatkówka',   icon_white: File.open(Rails.root.join("db/icons/valleyball_white.png")), icon_blue: File.open(Rails.root.join("db/icons/valleyball_blue.png"))    },
  { position: 5, id: 4, name: 'Baseball',    icon_white: File.open(Rails.root.join("db/icons/baseball_white.png")), icon_blue: File.open(Rails.root.join("db/icons/baseball_blue.png")) },
  { position: 6, id: 5, name: 'Rugby',       icon_white: File.open(Rails.root.join("db/icons/football_white.png")), icon_blue: File.open(Rails.root.join("db/icons/football_blue.png")) },
  { position: 1, id: 6, name: 'All',         icon_white: File.open(Rails.root.join("db/icons/all_white.png")), icon_blue: File.open(Rails.root.join("db/icons/all_blue.png")) }
)