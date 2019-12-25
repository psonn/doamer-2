class Property < ActiveRecord::Base
	belongs_to :user
	has_many :property_pictures, dependent: :destroy
	accepts_nested_attributes_for :property_pictures, reject_if: proc { |attributes| attributes['avatar_url'].blank? }, allow_destroy: true

	validates :title, presence: true

	mount_uploader :image, ImageUploader
end
