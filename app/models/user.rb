class User < ApplicationRecord
    belongs_to :team
    has_many :comments
    validates_uniqueness_of :username
    validates_uniqueness_of :email
end
