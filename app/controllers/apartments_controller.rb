class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all]


  # GET /apartments
  # GET /apartments.json
  def index
     @apartments= Apartment.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @apartments.to_csv }
      format.xls { send_data @apartments.to_csv(col_sep: "\t") }
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  def import
    Apartment.import(params[:file])
    if Apartment.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to apartments_path }
      end
    else
      @error_import = " code_provision: "
      Apartment.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apartment }
      else
        format.html { render action: 'new' }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Apartment.delete_all
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
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:code_provision, :new_code, :account_number, :alt_account_number,
                                        :tip, :region, :district, :type_settlement, :city, :street_type, :street_name,
                                        :number_house, :number_house2, :room_apartment, :area, :floor_area, :number_rooms, :storey,
                                        :floors, :series_home, :district_number, :uah_market_value, :usd_market_value,
                                        :euro_market_value)
    end
end
