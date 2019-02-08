class UserDetail < ApplicationRecord
	belongs_to :user
	has_one_attached :medical_status
	has_one_attached :proof_type_front
	has_one_attached :proof_type_back
	has_one_attached :profile
	enum medical_status_result: [:Negative, :Confidentaial, :I_will_tell_later]
end
