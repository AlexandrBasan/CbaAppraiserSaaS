class StaticPagesController < ApplicationController
  #before_action :current_user_check_nil


  def home
    @earths = Earth.paginate(page: params[:page])
    @houses = House.paginate(page: params[:page])
    @apartments = Apartment.paginate(page: params[:page])
    @anearts = Aneart.paginate(page: params[:page])
    @anaprtments = Anaprtment.paginate(page: params[:page])
    @users = User.paginate(page: params[:page])
    @currencies = Currency
  end


  def current_user_check_nil
    if current_user.nil?
      redirect_to root_path
      flash[:danger] = 'Доступ запрещен'
    else
    end
  end
end
