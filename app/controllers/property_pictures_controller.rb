class PropertyPicturesController < ApplicationController
  before_action :set_property_picture, only: [:show, :edit, :update, :destroy]

  def index
    @property_pictures = PropertyPicture.all
  end

  def show
  end

  def new
    @property_picture = PropertyPicture.new
  end

  def edit
  end

  def create
    params[:avatar_urls].each{ |avatar_url|
      @property_picture = PropertyPicture.create(avatar_url: avatar_url)
      if @property_picture.save
        respond_to do |format|
          format.html { render json: @property_picture.to_jq_upload, content_type: 'text/html', layout: false }
          format.json { render json: @property_picture.to_jq_upload }
        end
      else
        render json: { error: @property_picture.errors.full_messages }, status: 304
      end
    }
  end

  def update
    respond_to do |format|
      if @property_picture.update(property_picture_params)
        format.html { redirect_to @property_picture, notice: 'Property picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_picture }
      else
        format.html { render :edit }
        format.json { render json: @property_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property_picture.destroy
    respond_to do |format|
      format.html { redirect_to property_pictures_url, notice: 'Property picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_picture
      @property_picture = PropertyPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_picture_params
      params.require(:property_picture).permit(:name, :avatar_url, :property_id, :_destroy, :avatar_url_cache)
    end
end
