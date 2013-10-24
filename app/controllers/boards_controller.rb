class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  #cancan
  load_and_authorize_resource

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.find(:all, :conditions => {:user_id => current_user.id,:deleted_at => nil},:order => "created_at desc")
  end

  # GET /boards/list
  def list
    if params[:kind] == "0" then
      @boards = Board.includes(:user).where(:deleted_at=>nil).order("created_at desc").page(params[:page])
    else
      @boards = Board.includes(:user).where(:deleted_at=>nil,:kind=>params[:kind]).order("created_at desc").page(params[:page])
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
    @board.user_id = current_user.id
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render action: 'show', status: :created, location: @board }
      else
        format.html { render action: 'new' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.update_attribute(:deleted_at,Time.now)
    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id], :conditions => {:user_id => current_user.id})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:user_id, :kind, :subject, :body, :prefecture, :city, :town, :sex, :deleted_at)
    end
    def topic
      "掲示板"
    end
end
