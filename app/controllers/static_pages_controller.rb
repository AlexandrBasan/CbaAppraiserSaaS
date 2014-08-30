class StaticPagesController < ApplicationController
  #before_action :current_user_check_nil


  def home
    @tests = Test.paginate(page: params[:page])
    @earths = Test.paginate(page: params[:page])
    @homes = Test.paginate(page: params[:page])
    @appartments = Test.paginate(page: params[:page])
  end


  def current_user_check_nil
    if current_user.nil?
      redirect_to root_path
      flash[:danger] = 'Доступ запрещен'
    else
    end
  end
end
