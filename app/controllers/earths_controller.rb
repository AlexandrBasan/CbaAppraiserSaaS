class EarthsController < ApplicationController
  before_action :set_earth, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all, :processing]

  # GET /earths
  # GET /earths.json
  # GET /apartments.json
  def index
    @earths= Earth.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @earths.to_csv }
      format.xls { send_data @earths.to_csv(col_sep: "\t") }
      # format.xls # { send_data @tests.to_csv(col_sep: "\t") }
    end
  end


  def processing_earth
    @ea = Earth.all
    @ea.each do |earth|
      Aneart.where(district_number: earth.district_number).each do |anea|
        @earth = Cearth.new
        @earth.earth_id = earth.id
        @earth.aneart_id = anea.id
        @earth.save
      end
    end
    redirect_to (earth_path) and return
  end
  def import
    Earth.import(params[:file])
    if Earth.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to earths_path }
      end
    else
      @error_import = " code_provision: "
      Earth.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end

  # GET /earths/1
  # GET /earths/1.json
  def show
  end

  # GET /earths/new
  def new
    @earth = Earth.new
  end

  # GET /earths/1/edit
  def edit
  end

  # POST /earths
  # POST /earths.json
  def create
    @earth = Earth.new(earth_params)

    respond_to do |format|
      if @earth.save
        format.html { redirect_to earths_path, notice: 'Earth was successfully created.' }
        format.json { render action: 'show', status: :created, location: @earth }
      else
        format.html { render action: 'new' }
        format.json { render json: @earth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earths/1
  # PATCH/PUT /earths/1.json
  def update
    respond_to do |format|
      if @earth.update(earth_params)
        format.html { redirect_to earths_path, notice: 'Earth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @earth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earths/1
  # DELETE /earths/1.json
  def destroy
    @earth.destroy
    respond_to do |format|
      format.html { redirect_to earths_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Earth.destroy_all
    redirect_to earths_path
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
    def set_earth
      @earth = Earth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def earth_params
      params.require(:earth).permit(:code_provision, :tip, :region, :district, :city, :street_type, :street_name, :street_name2, :namber_home, :number, :housing, :room_apartment, :total_area, :floor_area, :area_land, :district_number, :kategorіya_repair, :uah_market_value, :usd_market_value, :euro_market_value)
    end
end
