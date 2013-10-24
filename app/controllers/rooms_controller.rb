require 'facility'
class RoomsController < ApplicationController
  include Facilities
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  #cancan
  load_and_authorize_resource

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.find(:all, :conditions => {:house_id => params[:house_id]},:order => "id")
    @house = House.find(params[:house_id],:conditions => {:owner_id => current_user.id})
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.house_id = params[:house_id]
    @facilities = listOfRoom
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.facilities = array_to_value(params[:facilities])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        @room.touch
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.joins(:house).where('"houses".owner_id=?',current_user.id).find(params[:id],:readonly=>false)
      @facilities = listOfRoom
      @selected_facilities = value_to_array(@room.facilities)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params[:room][:facilities] = array_to_value(params[:facilities])
      params.require(:room).permit(:house_id, :name, :largeness, :kind, :facilities, :sex, :rent, :expense, :note, :enable, :nationality, :photo1,:photo2,:deposit)
    end
    def topic
      "部屋・家賃"
    end
end
