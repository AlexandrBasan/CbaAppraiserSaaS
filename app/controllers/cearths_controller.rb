class CearthsController < ApplicationController
  before_action :set_cearth, only: [:show, :edit, :update, :destroy]

  # GET /cearths
  # GET /cearths.json
  def index
    @cearths = Cearth.all
  end

  # GET /cearths/1
  # GET /cearths/1.json
  def show
  end

  # GET /cearths/new
  def new
    @cearth = Cearth.new
  end

  # GET /cearths/1/edit
  def edit
  end

  # POST /cearths
  # POST /cearths.json
  def create
    @cearth = Cearth.new(cearth_params)

    respond_to do |format|
      if @cearth.save
        format.html { redirect_to calc_earths_path, notice: 'Cearth was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cearth }
      else
        format.html { render action: 'new' }
        format.json { render json: @cearth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cearths/1
  # PATCH/PUT /cearths/1.json
  def update
    respond_to do |format|
      if @cearth.update(cearth_params)
        format.html { redirect_to calc_earths_path, notice: 'Cearth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cearth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cearths/1
  # DELETE /cearths/1.json
  def destroy
    @cearth.destroy
    respond_to do |format|
      format.html { redirect_to cearths_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cearth
      @cearth = Cearth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cearth_params
      params.require(:cearth).permit(:auction, :location, :infrastructure, :diff_area, :adj_cost_value,
                                     :earth_id, :aneart_id)
    end
end
