class TiphousesController < ApplicationController
  before_action :set_tiphouse, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all]

  # GET /tiphouses
  # GET /tiphouses.json
  def index
    @tiphouses = Tiphouse.all
  end

  # GET /tiphouses/1
  # GET /tiphouses/1.json
  def show
  end

  # GET /tiphouses/new
  def new
    @tiphouse = Tiphouse.new
  end

  # GET /tiphouses/1/edit
  def edit
  end

  # POST /tiphouses
  # POST /tiphouses.json
  def create
    @tiphouse = Tiphouse.new(tiphouse_params)

    respond_to do |format|
      if @tiphouse.save
        format.html { redirect_to @tiphouse, notice: 'Tiphouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tiphouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @tiphouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiphouses/1
  # PATCH/PUT /tiphouses/1.json
  def update
    respond_to do |format|
      if @tiphouse.update(tiphouse_params)
        format.html { redirect_to @tiphouse, notice: 'Tiphouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tiphouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiphouses/1
  # DELETE /tiphouses/1.json
  def destroy
    @tiphouse.destroy
    respond_to do |format|
      format.html { redirect_to tiphouses_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Tiphouse.destroy_all
    redirect_to tiphouses_path
  end


  def current_user_check_nil
    if current_user.nil?
      redirect_to root_path
      flash[:danger] = 'Доступ запрещен'
    else
    end
  end

  def check_verification
    if current_user.try(:verification?)
    else
      redirect_to root_path
      flash[:danger] = 'Доступ запрещен'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiphouse
      @tiphouse = Tiphouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiphouse_params
      params.require(:tiphouse).permit(:num_analog, :o1, :o2, :o3, :o4)
    end
end
