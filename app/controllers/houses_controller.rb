class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all, :processing, :index]

  # GET /houses
  # GET /houses.json
  def index
    @chouses = Chouse.all
    @houses= House.paginate(page: params[:page])
    @a_houses= House.all
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @a_houses.to_csv }
      #format.xls { send_data @a_houses.to_csv(col_sep: "\t") }
      # format.xls # { send_data @tests.to_csv(col_sep: "\t") }
      format.xls
    end
  end
  # GET /houses/1
  # GET /houses/1.json
  def show
  end


  def processing_house
    @ho = House.all
    @ho.each do |house|
      Anhousehold.where(number_district: house.district_number).each do |anho|
        @chouse = Chouse.new
        @chouse.house_id = house.id
        @chouse.anhousehold_id = anho.id
        @chouse.save
      end
    end
    redirect_to (houses_path) and return
  end

  def import
    House.import(params[:file])
    if House.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to houses_path }
      end
    else
      @error_import = " code_provision: "
      House.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to houses_path, notice: 'House was successfully created.' }
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
        format.html { redirect_to houses_path, notice: 'House was successfully updated.' }
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
  def destroy_all
    Chouse.destroy_all
    House.destroy_all
    redirect_to houses_path
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
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:code_provision, :tip, :region, :district, :city, :street_type, :street_name, :street_name2, :namber_home, :number, :housing, :room_apartment, :total_area, :floor_area, :area_land, :district_number, :kategorіya_repair, :uah_market_value, :usd_market_value, :euro_market_value)
    end
end
