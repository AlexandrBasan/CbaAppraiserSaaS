class ChousesController < ApplicationController
  before_action :set_chouse, only: [:show, :edit, :update, :destroy]

  # GET /chouses
  # GET /chouses.json
  def index
    @chouses = Chouse.all
  end

  # GET /chouses/1
  # GET /chouses/1.json
  def show
  end

  # GET /chouses/new
  def new
    @chouse = Chouse.new
  end

  # GET /chouses/1/edit
  def edit
  end

  # POST /chouses
  # POST /chouses.json
  def create
    @chouse = Chouse.new(chouse_params)

    respond_to do |format|
      if @chouse.save
        format.html { redirect_to calc_houses_path, notice: 'Chouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @chouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chouses/1
  # PATCH/PUT /chouses/1.json
  def update
    respond_to do |format|
      if @chouse.update(chouse_params)
        format.html { redirect_to calc_houses_path, notice: 'Chouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chouses/1
  # DELETE /chouses/1.json
  def destroy
    @chouse.destroy
    respond_to do |format|
      format.html { redirect_to chouses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chouse
      @chouse = Chouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chouse_params
      params.require(:chouse).permit(:auction, :location, :infrastructure, :diff_area, :category_repair,
                                     :adj_cost_value, :house_id, :anhousehold_id)
    end
end
