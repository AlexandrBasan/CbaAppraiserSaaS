class CalcPagesController < ApplicationController
  def calc_apartment
    @apartments = Apartment.paginate(page: params[:page])
    @anaprtments = Anaprtment.all
    @capartments = Capartment.all
  end
  def calc_apartments_print
    @apartments = Apartment.all
    @anaprtments = Anaprtment.all
    @capartments = Capartment.all
  end
  def calc_earths
    @earths = Earth.all
    @anearths = Aneart.all
    @cearths = Cearth.all

  end
  def calc_houses
    @houses = House.all
    @anhouses = Anhousehold.all
    @chouse = Chouse.all
  end
end
