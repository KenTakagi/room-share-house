class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  #cancan 
  load_and_authorize_resource

  # GET /stations
  # GET /stations.json
  def index
    #@stations = Station.all
    @stations = Station.page(params[:page]).order(:id)
  end
  # GET /stations/:line_cd/fromline
  # GET /stations/:iine_cd/fromline.json
  def fromline
    @stations = Station.find(:all, :conditions => {:line_id=>params[:line_id],:display_flg=>0},:order =>"sort,id")
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @station }
      else
        format.html { render action: 'new' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit( :line_id, :group_id, :zipcode, :name ,:address, :pref_cd, :lon, :lat, :display_flg, :sort)
    end
    def topic
      "駅"
    end
end
