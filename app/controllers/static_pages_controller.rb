class StaticPagesController < ApplicationController
  def home
    @tests = Test.paginate(page: params[:page])
    @earths = Test.paginate(page: params[:page])
    @homes = Test.paginate(page: params[:page])
    @appartments = Test.paginate(page: params[:page])
  end
end
