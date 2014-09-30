class AnaprtmentsController < ApplicationController
  before_action :set_anaprtment, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all, :index]

  # GET /anaprtments
  # GET /anaprtments.json
  def index
    @anaprtments= Anaprtment.paginate(page: params[:page])
    @a_anaprtments= Anaprtment.all
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @a_anaprtments.to_csv }
      #format.xls { send_data @a_anaprtments.to_csv(col_sep: "\t") }
      # format.xls # { send_data @tests.to_csv(col_sep: "\t") }
      format.xls
  end
end
  # GET /anaprtments/1
  # GET /anaprtments/1.json
  def show
  end
  def import
    Anaprtment.import(params[:file])
    if Anaprtment.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to anaprtments_path }
      end
    else
      @error_import = " district_number: "
      Anaprtment.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end
  # GET /anaprtments/new
  def new
    @anaprtment = Anaprtment.new
  end

  # GET /anaprtments/1/edit
  def edit
  end

  # POST /anaprtments
  # POST /anaprtments.json
  def create
    @anaprtment = Anaprtment.new(anaprtment_params)

    respond_to do |format|
      if @anaprtment.save
        format.html { redirect_to anaprtments_path, notice: 'Anaprtment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @anaprtment }
      else
        format.html { render action: 'new' }
        format.json { render json: @anaprtment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anaprtments/1
  # PATCH/PUT /anaprtments/1.json
  def update
    respond_to do |format|
      if @anaprtment.update(anaprtment_params)
        format.html { redirect_to anaprtments_path, notice: 'Anaprtment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @anaprtment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anaprtments/1
  # DELETE /anaprtments/1.json
  def destroy
    @anaprtment.destroy
    respond_to do |format|
      format.html { redirect_to anaprtments_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    Anaprtment.destroy_all
    redirect_to anaprtments_path
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
    def set_anaprtment
      @anaprtment = Anaprtment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anaprtment_params
      params.require(:anaprtment).permit(:district_number, :numberpp, :location, :source, :area, :number_rooms, :cost_analogue_usd, :floor, :storeys, :building_type, :category_repair, :cost_one)
    end
end
