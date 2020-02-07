class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
=======
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
>>>>>>> refs/remotes/origin/master

  has_many :tickets
  has_many :responses
  has_many :ticket_respones, through: :tickets, source: :response
  has_many :responded_tickets, through: :responses, source: :ticket

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
