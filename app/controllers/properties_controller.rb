class PropertiesController < ApplicationController
	before_action :set_property, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user, only: [:edit, :update, :destroy]

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
	    	respond_to do |format|
	    		format.html { redirect_to @property, notice: 'Property was successfully created.'}
	    		format.json { render layout: false }
	    	end
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
end
