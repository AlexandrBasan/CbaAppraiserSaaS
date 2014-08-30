class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :check_user, only: [:create, :new]
  before_action :check_admin, only: [:collaboration]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = I18n.t 'flash.welcome_to_saas'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t 'flash.profile_updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  # Check user role
  def check_user
    if current_user
      redirect_to root_path
    end
  end

  def check_admin
    if current_user && current_user.admin?
      redirect_to root_path
      flash[:danger] = 'Доступ запрещен'
    end
  end

  private
  # Save information in database - PRIVAT
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters

  def correct_user
    @user = User.find(params[:id])
    if current_user.admin?
    else
      redirect_to(root_url) unless current_user?(@user)
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Sortable for index inquiry and settlements
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
