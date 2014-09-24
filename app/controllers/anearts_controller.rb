class AneartsController < ApplicationController
  before_action :set_aneart, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import]
  # GET /anearts
  # GET /anearts.json
  def index
    @aneart= Aneart.new
    @anearts= Aneart.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @anearts.to_csv }
      format.xls { send_data @anearts.to_csv(col_sep: "\t") }
      # format.xls # { send_data @tests.to_csv(col_sep: "\t") }
  end
end
  # GET /anearts/1
  # GET /anearts/1.json
  def show
  end

  def import
    Aneart.import(params[:file])
    if Aneart.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to anearts_path }
      end
    else
      @error_import = " district_number: "
      aneart.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end


  # GET /anearts/new
  def new
    @aneart = Aneart.new
  end

  # GET /anearts/1/edit
  def edit
  end

  # POST /anearts
  # POST /anearts.json
  def create
    @aneart = Aneart.new(aneart_params)

    respond_to do |format|
      if @aneart.save
        format.html { redirect_to anearts_path, notice: 'Aneart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aneart }
      else
        format.html { render action: 'new' }
        format.json { render json: @aneart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anearts/1
  # PATCH/PUT /anearts/1.json
  def update
    respond_to do |format|
      if @aneart.update(aneart_params)
        format.html { redirect_to @aneart, notice: 'Aneart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aneart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anearts/1
  # DELETE /anearts/1.json
  def destroy
    @aneart.destroy
    respond_to do |format|
      format.html { redirect_to anearts_url }
      format.json { head :no_content }
    end
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
    def set_aneart
      @aneart = Aneart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aneart_params
      params.require(:aneart).permit(:district_number, :analogs_address, :area, :purpose, :value_proposition_usd, :information_source, :value_proposition_usdone)
    end
end
