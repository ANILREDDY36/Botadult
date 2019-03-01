class UserDetail < ApplicationRecord
	belongs_to :user
	has_one_attached :medical_status
	has_one_attached :proof_type_front
	has_one_attached :proof_type_back
	has_one_attached :profile
	# phony_normalize :contact_number, default_country_code: 'US'
	enum medical_status_result: [:Negative, :Confidentaial, :I_will_tell_later]
	before_create :verify_age
	validates :birthday, presence: true
	validates :user_name, presence: true
end
