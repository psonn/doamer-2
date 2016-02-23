class PropertiesController < ApplicationController
	before_action :set_property, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user, only: [:edit, :update, :destroy]
	before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

	def index
		@properties = Property.order("created_at DESC")
	end

	def show
	end

	def new
		@property = current_user.properties.build
	end

	def edit
	end

	def create
		@property = current_user.properties.build(property_params)
	    if @property.save
	    	#redirect_to property_steps_path(@property), :property_id => @property.id
	    	redirect_to property_steps_path(:id => "description", :property_id => @property.id)
	    else
	    	render :new
	    end
	end

	def update
		if @property.update(property_params)
	      redirect_to @property, notice: 'Property was successfully updated.'
	    else
	      render :edit
	    end
	end

	def destroy
		@property.destroy
		redirect_to properties_url
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find_by(id: params[:id])
    end

    def correct_user
      @property = current_user.properties.find_by(id: params[:id])
      redirect_to properties_path, notice: "Not authorized to edit this property" if @property.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :description_short, :description_long, :city, :state, :country, :latitude, :longitude, :postcode, :image, :remote_image_url, :image_cache, :remove_image)
    end

    def set_s3_direct_post
    	@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end
