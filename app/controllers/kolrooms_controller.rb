class KolroomsController < ApplicationController
  before_action :set_kolroom, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check_nil
  before_action :check_verification, only: [:create, :edit, :update, :destroy, :new, :import, :destroy_all, :index]

  # GET /kolrooms
  # GET /kolrooms.json
  def index
    @kolrooms = Kolroom.all
  end

  # GET /kolrooms/1
  # GET /kolrooms/1.json
  def show
  end

  # GET /kolrooms/new
  def new
    @kolroom = Kolroom.new
  end

  # GET /kolrooms/1/edit
  def edit
  end

  # POST /kolrooms
  # POST /kolrooms.json
  def create
    @kolroom = Kolroom.new(kolroom_params)

    respond_to do |format|
      if @kolroom.save
        format.html { redirect_to kolrooms_path, notice: 'Kolroom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kolroom }
      else
        format.html { render action: 'new' }
        format.json { render json: @kolroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kolrooms/1
  # PATCH/PUT /kolrooms/1.json
  def update
    respond_to do |format|
      if @kolroom.update(kolroom_params)
        format.html { redirect_to kolrooms_path, notice: 'Kolroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kolroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kolrooms/1
  # DELETE /kolrooms/1.json
  def destroy
    @kolroom.destroy
    respond_to do |format|
      format.html { redirect_to kolrooms_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Kolroom.destroy_all
    redirect_to kolrooms_path
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
    def set_kolroom
      @kolroom = Kolroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kolroom_params
      params.require(:kolroom).permit(:num_analog, :o1, :o2, :o3, :o4)
    end
end
