class AnhouseholdsController < ApplicationController
  before_action :set_anhousehold, only: [:show, :edit, :update, :destroy]

  # GET /anhouseholds
  # GET /anhouseholds.json
  def index
    @anhouseholds = Anhousehold.all
  end

  # GET /anhouseholds/1
  # GET /anhouseholds/1.json
  def show
  end

  # GET /anhouseholds/new
  def new
    @anhousehold = Anhousehold.new
  end

  # GET /anhouseholds/1/edit
  def edit
  end

  # POST /anhouseholds
  # POST /anhouseholds.json
  def create
    @anhousehold = Anhousehold.new(anhousehold_params)

    respond_to do |format|
      if @anhousehold.save
        format.html { redirect_to @anhousehold, notice: 'Anhousehold was successfully created.' }
        format.json { render action: 'show', status: :created, location: @anhousehold }
      else
        format.html { render action: 'new' }
        format.json { render json: @anhousehold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anhouseholds/1
  # PATCH/PUT /anhouseholds/1.json
  def update
    respond_to do |format|
      if @anhousehold.update(anhousehold_params)
        format.html { redirect_to @anhousehold, notice: 'Anhousehold was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @anhousehold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anhouseholds/1
  # DELETE /anhouseholds/1.json
  def destroy
    @anhousehold.destroy
    respond_to do |format|
      format.html { redirect_to anhouseholds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anhousehold
      @anhousehold = Anhousehold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anhousehold_params
      params.require(:anhousehold).permit(:number_district, :danalog, :darea_building, :darea_land, :dvalue_proposition_usd, :dvalue_proposition_usd_no_land, :dvalue_proposition_usd_kvm, :dcategory_repair, :dsource_information, :zanalog, :zarea, :zpurpose, :zvalue_proposition_usd, :zsource_information, :zvalue_proposition_usd_kvm)
    end
end
