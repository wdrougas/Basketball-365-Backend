# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'active_support'

User.destroy_all
Comment.destroy_all
Game.destroy_all
Player.destroy_all
TeamGame.destroy_all
Team.destroy_all

headers = {
  "X-RapidAPI-Host" => "api-nba-v1.p.rapidapi.com",
  "X-RapidAPI-Key" => Rails.application.credentials.API_KEY
}

teams = RestClient.get("https://api-nba-v1.p.rapidapi.com/teams/league/standard", headers)
players = RestClient.get("https://api-nba-v1.p.rapidapi.com/players/league/standard", headers)
games = RestClient.get('https://api-nba-v1.p.rapidapi.com/games/league/standard/2019', headers)

teams_array = JSON.parse(teams)['api']['teams']
#teamID = JSON.parse(teams)['api']['teams'][index]['teamId']
players_array = JSON.parse(players)['api']['players']
#teamID = JSON.parse(players)['api']['players'][index]['teamId']
#playerID = JSON.parse(players)['api']['players'][index]['playerId']
games_array = JSON.parse(games)['api']['games']
# visiting team teamID = JSON.parse(games)['api']['games'][index]['vTeam']['teamId']
# home team teamID = JSON.parse(games)['api']['games'][index]['hTeam']['teamId']


teams_array.each do |team|

  if (team['leagues']['standard']['confName'] != 'Intl' &&  team['logo'] != "") 
  Team.create(
    team_id: team['teamId'],
    name: team['fullName'],
    logo: team['logo']
  )
  end
end


players_array.each do |player|
  Player.create(
    player_id: player['playerId'].to_i,
    college: player['collegeName'],
    country: player['country'],
    yearsPro: player['yearsPro'],
    team_id: player['teamId'].to_i,
    date_of_birth: player['dateOfBirth'],
    position: player['leagues']['standard']['pos'],
    first_name: player['firstName'],
    last_name: player ['lastName']
  )
end

games_array.each do |game|
  if (game['startTimeUTC'].to_datetime > 'Tue, 22 Oct 2019 00:00:00 +0000')
    byebug
  Game.create(
    game_id: game['gameId'].to_i,
    visiting_team: game['vTeam']['fullName'],
    visiting_team_id: game['vTeam']['teamId'].to_i,
    visiting_team_score: game['vTeam']['score']['points'],
    home_team: game['hTeam']['fullName'],
    home_team_id: game['hTeam']['teamId'].to_i,
    home_team_score: game['hTeam']['score']['points'],
    arena: game['arena'],
    city: game['city'],
    date: game['startTimeUTC'].to_datetime
  )
  end
end











will = User.create(username: 'wdrougas', password_digest: 'password', email: 'wdrougas@gmail.com', first_name: 'Will', last_name: 'Drougas', team_id: 17)

