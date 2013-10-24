require 'facility'
class HousesController < ApplicationController
  include Facilities
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  #cancan
  load_and_authorize_resource

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.find(:all, :conditions => {:owner_id => current_user.id},:order => "id")
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
    @company = RailCompany.all.order("sort")
    @facilities = listOfHouse
    @selected_facilitiec = value_to_array(@house.facility)
  end

  # GET /houses/1/edit
  def edit
    #@house= House.find(params[:id])
    @company = RailCompany.all.order("sort")
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
	  @house.owner_id = current_user.id
	  @house.facility = array_to_value(params[:facilities])

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render action: 'show', status: :created, location: @house }
      else
        format.html { render action: 'new' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        @house.touch
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id], :conditions => {:owner_id => current_user.id})
      @facilities = listOfHouse
      @selected_facilities = value_to_array(@house.facility)
      if @house.near_station_cd.nil? then
        @station = nil
      else
        @station = Station.find_by_id(@house.near_station_cd)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params[:house][:facility] = array_to_value(params[:facilities])
      params.require(:house).permit(:name, :capacity, :owner_id, :photo1,:photo2,:prefecture,
      	:city,:town,:note,:from_station,:near_station_cd,:kind,:facility)
    end
    def topic
      "家・施設"
    end
end
