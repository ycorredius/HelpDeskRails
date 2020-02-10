class Ticket < ApplicationRecord
    belongs_to :user
    has_many :responses
    has_many :responded_users, through: :responses, source: :user

    validates :description, presence: true
    validates :content, presence: true

    scope :resolved, -> {where(is_resolved: true)}
    scope :not_resolved, -> {where(is_resolved: false)}
end
