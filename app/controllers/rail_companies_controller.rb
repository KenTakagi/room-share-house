class RailCompaniesController < ApplicationController
  before_action :set_rail_company, only: [:show, :edit, :update, :destroy]
  #cancan
  load_and_authorize_resource

  # GET /rail_companies
  # GET /rail_companies.json
  def index
    @rail_companies = RailCompany.all
  end

  # GET /rail_companies/1
  # GET /rail_companies/1.json
  def show
  end

  # GET /rail_companies/new
  def new
    @rail_company = RailCompany.new
  end

  # GET /rail_companies/1/edit
  def edit
  end

  # POST /rail_companies
  # POST /rail_companies.json
  def create
    @rail_company = RailCompany.new(rail_company_params)

    respond_to do |format|
      if @rail_company.save
        format.html { redirect_to @rail_company, notice: 'Rail company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rail_company }
      else
        format.html { render action: 'new' }
        format.json { render json: @rail_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rail_companies/1
  # PATCH/PUT /rail_companies/1.json
  def update
    respond_to do |format|
      if @rail_company.update(rail_company_params)
        format.html { redirect_to @rail_company, notice: 'Rail company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rail_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rail_companies/1
  # DELETE /rail_companies/1.json
  def destroy
    @rail_company.destroy
    respond_to do |format|
      format.html { redirect_to rail_companies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rail_company
      @rail_company = RailCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rail_company_params
      params.require(:rail_company).permit(:rr_id, :name, :url, :company_type, :status, :sort)
    end
    def topic
      "鉄道会社"
    end
end
