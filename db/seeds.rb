# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'


Game.destroy_all
Player.destroy_all
Favorite.destroy_all
Comment.destroy_all
Team.destroy_all
Standing.destroy_all
User.destroy_all

headers = {
  "X-RapidAPI-Host" => "api-nba-v1.p.rapidapi.com",
  "X-RapidAPI-Key" => ENV['API_KEY']
}

teams = RestClient.get("https://api-nba-v1.p.rapidapi.com/teams/league/standard", headers)
players = RestClient.get("https://api-nba-v1.p.rapidapi.com/players/league/standard", headers)
games = RestClient.get('https://api-nba-v1.p.rapidapi.com/games/league/standard/2019', headers)
east_standings = RestClient.get("https://api-nba-v1.p.rapidapi.com/standings/standard/2019/conference/East", headers)
west_standings = RestClient.get("https://api-nba-v1.p.rapidapi.com/standings/standard/2019/conference/West", headers)

teams_array = JSON.parse(teams)['api']['teams']
#teamID = JSON.parse(teams)['api']['teams'][index]['teamId']
players_array = JSON.parse(players)['api']['players']
#teamID = JSON.parse(players)['api']['players'][index]['teamId']
#playerID = JSON.parse(players)['api']['players'][index]['playerId']
games_array = JSON.parse(games)['api']['games']
# visiting team teamID = JSON.parse(games)['api']['games'][index]['vTeam']['teamId']
# home team teamID = JSON.parse(games)['api']['games'][index]['hTeam']['teamId']
east_standings_array = JSON.parse(east_standings)['api']['standings']
west_standings_array = JSON.parse(west_standings)['api']['standings']



teams_array.each do |team|

  if (team['leagues']['standard']['confName'] != 'Intl' &&  team['logo'] != "") 
  Team.create(
    team_id: team['teamId'].to_i,
    name: team['fullName'],
    logo: team['logo']
  )
  end
end

pistons = Team.all.find_by(name: "Detroit Pistons")
pistons.destroy


Team.create(
  team_id: 10,
  name: "Detroit Pistons",
  logo: 'data:image/png;base64,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'
)


players_array.each do |player|
  team = Team.all.find_by(team_id: player['teamId'].to_i)
  if(player['teamId'] != nil && team)
  Player.create(
    player_id: player['playerId'].to_i,
    college: player['collegeName'],
    country: player['country'],
    yearsPro: player['yearsPro'],
    team_id: team.id,
    date_of_birth: player['dateOfBirth'],
    position: player['leagues']['standard']['pos'],
    first_name: player['firstName'],
    last_name: player ['lastName']
  )
  end
end

games_array.each do |game|
  visiting_team = Team.all.find_by(team_id: game['vTeam']['teamId'].to_i)
  home_team = Team.all.find_by(team_id: game['hTeam']['teamId'].to_i)
  if (game['startTimeUTC'].to_datetime > 'Tue, 22 Oct 2019 00:00:00 +0000' && visiting_team && home_team)
  game = Game.create(
    game_id: game['gameId'].to_i,
    visiting_team_name: visiting_team.name,
    visiting_team_logo: visiting_team.logo,
    visiting_team_id: visiting_team.id,
    visiting_team_score: game['vTeam']['score']['points'],
    home_team_name: home_team.name,
    home_team_logo: home_team.logo,
    home_team_id: home_team.id,
    home_team_score: game['hTeam']['score']['points'],
    arena: game['arena'],
    city: game['city'],
    date: game['startTimeUTC'].to_time.strftime('%Y-%-m-%-d')
  )
  end
end

east_standings_array.each do |standing|
  team = Team.all.find_by(team_id: standing['teamId'].to_i)
  east_standing = Standing.create(
    team_name: team.name,
    team_logo: team.logo,
    team_id: team.id,
    win: standing['win'].to_i,
    loss: standing['loss'].to_i,
    conference: standing['conference']['name']
  )
end


west_standings_array.each do |standing|
  team = Team.all.find_by(team_id: standing['teamId'].to_i)
  west_standing = Standing.create(
    team_name: team.name,
    team_logo: team.logo,
    team_id: team.id,
    win: standing['win'].to_i,
    loss: standing['loss'].to_i,
    conference: standing['conference']['name']
  )
end

0
#will = User.create(username: 'wdrougas', password_digest: 'password', email: 'wdrougas@gmail.com', first_name: 'Will', last_name: 'Drougas', team_id: 17)



