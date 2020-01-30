class Game < ApplicationRecord
    belongs_to :visiting_team, :class_name => 'Team'
    belongs_to :home_team, :class_name => 'Team'
end
