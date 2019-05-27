class Pin < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }

	belongs_to :user
	has_attached_file :image, :styles => { :show => "600x600", :medium => "300x300>", :thumb => "100x100>" }, s3_region: ENV["AWS_REGION"]
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates_presence_of :description, :image

	acts_as_votable
end