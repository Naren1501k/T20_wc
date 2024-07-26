
# 10.times do |i|
#     Team.create!(
#       name: "Team #{i + 1}",
#       country: ["India", "Australia", "England", "South Africa", "New Zealand"].sample,
#       founded: rand(1901..2021),
#       description: "This is the description for Team #{i + 1}",
#       player_count: 0
#     )
#   end
  

#   team_ids = Team.pluck(:id)
#   30.times do |i|
#     Player.create!(
#       name: "Player #{i + 1}",
#       age: rand(18..40),
#       position: ["Slips", "Gully", "Point", "Wicket Keeper", "Third Man", "Square Leg", "Fine Leg", "Mid-Wicket", "Mid Off", "Mid On", "Long Off", "Long On"].sample,
#       team_id: team_ids.sample,
#       role: ["allrounder", "bowler", "batsman"].sample,
#       description: "This is the description for Player #{i + 1}"
#     )
#   end
  
  
#   team_ids = Team.pluck(:id)

#   15.times do |i|
#     home_team_id, away_team_id = team_ids.sample(2)
  
#     Match.create!(
#       location: "Location #{i + 1}",
#       date: Date.today + i.days,
#       home_team_id: home_team_id,
#       away_team_id: away_team_id
#     )
#   end