class PropertyStepsController < ApplicationController
  include Wicked::Wizard
  steps :description, :picture

  before_action :set_s3_direct_post, only: [:show, :update]
  
  def show
  	@property = Property.find(params[:property_id])
    render_wizard
  end

  def update
  	@property = Property.find(params[:property_id])
	@property.update_attributes(property_params)
	render_wizard @property
  end

  private

  def property_params
    params.require(:property).permit(:title, :description_short, :description_long, :city, :state, :country, :latitude, :longitude, :postcode, :image, :remote_image_url, :image_cache, :remove_image, :image_url)
  end

  def redirect_to_finish_wizard(options = nil)
  	redirect_to @property, notice: "Thanks for submitting a property."
  end

  def set_s3_direct_post
  	@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
