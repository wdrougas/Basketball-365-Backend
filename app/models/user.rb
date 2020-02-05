class User < ApplicationRecord
    belongs_to :team
    has_many :comments
    has_many :favorites
    has_many :players, through: :favorites
    validates_uniqueness_of :username
    validates_uniqueness_of :email
end
