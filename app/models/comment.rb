class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :team
    validates :body, presence: true
end
