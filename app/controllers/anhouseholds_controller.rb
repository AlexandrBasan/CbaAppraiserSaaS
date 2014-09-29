class AnhouseholdsController < ApplicationController
  before_action :set_anhousehold, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all]


  # GET /anhouseholds
  # GET /anhouseholds.json
  def index
    @anhouseholds = Anhousehold.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @apartments.to_csv }
      format.xls { send_data @apartments.to_csv(col_sep: "\t") }
    end
  end

  def import
    Anhousehold.import(params[:file])
    if Anhousehold.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to anhousehold_path }
      end
    else
      @error_import = " code_provision: "
      Anhousehold.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
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
        format.html { redirect_to anhouseholds_path, notice: 'Anhousehold was successfully created.' }
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
        format.html { redirect_to anhouseholds_path, notice: 'Anhousehold was successfully updated.' }
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

  def destroy_all
    Anhousehold.delete_all
    redirect_to anhouseholds_path
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
    def set_anhousehold
      @anhousehold = Anhousehold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anhousehold_params
      params.require(:anhousehold).permit(:number_district, :danalog, :darea_building, :darea_land,
                                          :dvalue_proposition_usd, :dvalue_proposition_usd_no_land,
                                          :dvalue_proposition_usd_kvm, :dcategory_repair, :dsource_information,
                                          :zanalog, :zarea, :zpurpose, :zvalue_proposition_usd, :zsource_information,
                                          :zvalue_proposition_usd_kvm, :mediana )
    end
end
