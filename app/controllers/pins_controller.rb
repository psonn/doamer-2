class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html, :json

  def index
    @pins = Pin.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def show
  end

  def new
    @pin = current_user.pins.build
    respond_modal_with @pin
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

def like
  @pin = Pin.find(params[:id])
  @pin.liked_by current_user
  respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
  @pin.create_activity :like, owner: current_user
end

def unlike
  @pin = Pin.find(params[:id])
  @pin.unliked_by current_user
  respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
  @pin.create_activity :unlike, owner: current_user
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find_by(id: params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end