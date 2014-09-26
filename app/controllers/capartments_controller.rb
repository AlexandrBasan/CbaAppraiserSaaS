class CapartmentsController < ApplicationController
  before_action :set_capartment, only: [:show, :edit, :update, :destroy]

  # GET /capartments
  # GET /capartments.json
  def index
    @capartments = Capartment.all
  end

  # GET /capartments/1
  # GET /capartments/1.json
  def show
  end

  # GET /capartments/new
  def new
    @capartment = Capartment.new
  end

  # GET /capartments/1/edit
  def edit
  end

  # POST /capartments
  # POST /capartments.json
  def create
    @capartment = Capartment.new(capartment_params)

    respond_to do |format|
      if @capartment.save
        format.html { redirect_to @capartment, notice: 'Capartment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @capartment }
      else
        format.html { render action: 'new' }
        format.json { render json: @capartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capartments/1
  # PATCH/PUT /capartments/1.json
  def update
    respond_to do |format|
      if @capartment.update(capartment_params)
        format.html { redirect_to @capartment, notice: 'Capartment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @capartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capartments/1
  # DELETE /capartments/1.json
  def destroy
    @capartment.destroy
    respond_to do |format|
      format.html { redirect_to capartments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capartment
      @capartment = Capartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capartment_params
      params.require(:capartment).permit(:auction, :tip_house, :value_repair, :storey, :rooms, :adj_cost_value, :median, :money_usd, :money_euro, :money_uah, :apartment_id, :anaprtment_id)
    end
end
