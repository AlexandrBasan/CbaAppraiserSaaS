class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.paginate(page: params[:page])
    respond_to do |format|
      format.html
      # export to csv and xls
      format.csv { send_data @tests.to_csv }
      format.xls { send_data @tests.to_csv(col_sep: "\t") }
      # format.xls # { send_data @tests.to_csv(col_sep: "\t") }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  def import
    Test.import(params[:file])
    if Test.check_import_errors == true
      respond_to do |format|
        format.html { flash[:success] = 'Импорт успешно завершен.'
        redirect_to tests_path }
      end
    else
      @error_import = " ID: "
      Test.check_import_errors.each_with_index do |product, index|
        @error_import += "#{product} "
      end
      respond_to do |format|
        format.html { flash[:danger] = ('Ошибка импорта данных. Проверьте данные.' + @error_import)
        redirect_to root_path }
      end
    end
    #redirect_to root_url, notice: "Products imported."
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
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
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:col_1_s, :col_2_i, :col_3_ru)
    end
end
