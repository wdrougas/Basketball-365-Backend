class Player < ApplicationRecord
    belongs_to :team
    has_many :favorites
    has_many :users, through: :favorites
end
