class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets
  has_many :responses
  has_many :ticket_respones, through: :tickets, source: :response
  has_many :responded_tickets, through: :responses, source: :ticket

end
