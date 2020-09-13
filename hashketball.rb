# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

#*********Helpers**************
def get_all_players

players_array = game_hash[:home][:players] << game_hash[:away][:players]
players_array
end


def get_team(team)
  case team
  when game_hash[:home][:team_name]
    game_hash[:home]
  when game_hash[:away][:team_name]
    game_hash[:away]
  end
end

def team_players(team)
  case team
  when game_hash[:home][:team_name]
    game_hash[:home][:players][0]
  when game_hash[:away][:team_name]
    game_hash[:away][:players][0]
  end
end


#**************End Helpers**************

def num_points_scored(player)
player_points = 0

  game_hash.each do |key, value|
    value[:players].each do |name|
      if player == name[:player_name]
        player_points = name[:points]
      end 
    end 
  end  
player_points  
end

def shoe_size(player)
  player_shoe_size = 0

  game_hash.each do |key, value|
    value[:players].each do |name|
      if player == name[:player_name]
        player_shoe_size = name[:shoe]
      end 
    end 
  end  
player_shoe_size  
end

def team_colors(team)
  get_team(team)[:colors]
end

def team_names
 team_name_array = []
  game_hash.each do |key, value|
      team_name_array << value[:team_name]
  end  
team_name_array 
end

def player_numbers(team)
  array_of_numbers = []
  get_team(team)[:players].each do |numbers|
      array_of_numbers << numbers[:number]
  end  
array_of_numbers
end

def player_stats(player)
stat_hash = {}
  game_hash.each do |key, value|
    value[:players].each do |name|
      if player == name[:player_name]
        stat_hash = name
      end  
    end
  end 
stat_hash  
end

def big_shoe_rebounds
rebounds = 0  
  game_hash.each do |key, value|
    rebounds = value[:players].max_by{|shoe| shoe[:shoe]}[:rebounds]
    return rebounds
  end
end


#**bonus**

def most_points_scored
player_with_most_points =""    
  game_hash.each do |key, value|
    player_with_most_points = value[:players].each.max_by {|points| points[:points]}[:player_name]
  end
player_with_most_points
end  

def winning_team
home_team_array = []
away_team_array = []
home_team_total = 0
away_team_total = 0
game_hash.each do |key, value|
     if key == :home
       value[:players].each do |points|
         home_team_array << points[:points]
       end
     else if key == :away
       value[:players].each do |points|
         away_team_array << points[:points]
       end 
     end
end
end
home_team_total = home_team_array.reduce(0) {|total, num| total + num}
away_team_total = away_team_array.reduce(0) {|total, num| total + num}

if home_team_total > away_team_total
  return "The #{game_hash[:home][:team_name]} win!!"
else
  return "The #{game_hash[:away][:team_name]} Win!!"
end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |key, value|
    longest_name = value[:players].max_by {|name|  name[:player_name].length}[:player_name]
  end
longest_name 
end
  
#**super bonus**

def long_name_steals_a_ton?
  most_steals = 0
  game_hash.each do |key, value|
    most_steals = value[:players].max_by {|steals| steals[:steals]}[:player_name]
  end
  if player_with_longest_name == most_steals
    p "#{player_with_longest_name} steals the most"
  else
    p "Someone else steals a lot"
  end  
end  