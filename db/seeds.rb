# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'

# User.destroy_all
# Comment.destroy_all
# Game.destroy_all
# Player.destroy_all
# TeamGame.destroy_all
# Team.destroy_all

headers = {
    "X-RapidAPI-Host" => "api-nba-v1.p.rapidapi.com",
    "X-RapidAPI-Key" => ENV["API_KEY"]
  }

teams = RestClient.get("https://api-nba-v1.p.rapidapi.com/teams/league/standard", headers)
players = RestClient.get("https://api-nba-v1.p.rapidapi.com/players/league/standard", headers)
games = RestClient.get('https://api-nba-v1.p.rapidapi.com/games/league/standard/2019', headers)

byebug
teams_array = JSON.parse(teams)['api']['teams']
#teamID = JSON.parse(teams)['api']['teams'][index]['teamId']
players_array = JSON.parse(players)['api']['teams']
#teamID = JSON.parse(players)['api']['players'][index]['teamId']
#playerID = JSON.parse(players)['api']['players'][index]['playerId']
games_array = JSON.parse(games)['api']['games']
# visiting team teamID = JSON.parse(games)['api']['games'][index]['vTeam']['teamId']
# home team teamID = JSON.parse(games)['api']['games'][index]['hTeam']['teamId']



# will = User.create(username: 'wdrougas', password_digest: 'password', email: 'wdrougas@gmail.com', first_name: 'Will', last_name: 'Drougas', team_id: 17)

