class OfficePhoto < ActiveRecord::Base
	belongs_to :company_profile
	mount_uploader :images, OfficePhotoUploader

	# VALIDATIONS HERE
	validates 	:images, presence: true
end
