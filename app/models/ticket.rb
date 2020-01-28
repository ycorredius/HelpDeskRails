class Ticket < ApplicationRecord
    belongs_to :user
    has_many :responses
    has_many :responded_users, through: :responses, source: :user

end
