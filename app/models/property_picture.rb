class PropertyPicture < ActiveRecord::Base
	belongs_to :property
	validates :property, presence: true

	# Avatar uploader using carrierwave
	mount_uploader :avatar_url, AvatarUploader

	def to_jq_upload
		{
			"url" => avatar_url.medium.url,
			"delete_url" => id,
			"property_picture_id" => id,
			"delete_type" => "DELETE"
		}.to_json
	end
end