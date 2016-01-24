class PropertyStepsController < ApplicationController
  include Wicked::Wizard
  steps :description, :picture
  
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
    params.require(:property).permit(:title, :description_short, :description_long, :city, :state, :country, :latitude, :longitude, :postcode, :image, :remote_image_url, :image_cache, :remove_image)
  end

  def redirect_to_finish_wizard(options = nil)
  	redirect_to @property, notice: "Thanks for submitting a property."
  end
end
