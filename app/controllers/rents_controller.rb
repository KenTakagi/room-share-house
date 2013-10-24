require 'facility'
class RentsController < ApplicationController
  include Facilities

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.includes(:house).where(:enable=>true).order("updated_at desc").page(params[:page])
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.includes(:house).order("updated_at desc").find(params[:id])
    @station = Station.find(@room.house.near_station_cd)
    @room_facilities = listOfRoom
    @house_facilities = listOfHouse
    @selected_room_facilities = value_to_array(@room.facilities)
    @selected_house_facilities = value_to_array(@room.house.facility)
    @owner = User.find(@room.house.owner_id)
  end
  def topic
    "部屋・家賃一覧"
  end
end
