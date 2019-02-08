class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:  [:facebook, :google_oauth2]
  validates :is_twentyone, acceptance: { accept: true }
  validates :agree_terms_and_conditions, acceptance: { accept: true }
  validates :email, presence: true
  validates :password, presence: true
  has_one :user_detail

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end       
end
