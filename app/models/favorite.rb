class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :player
    validates_uniqueness_of :user_id, scope: :player_id
end
