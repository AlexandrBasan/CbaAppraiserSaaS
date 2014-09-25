class CalcPagesController < ApplicationController
  def calc_apartment
    @apartments = Apartment.all
    @anaprtments = Anaprtment.all
    @torg = -3
    @tiphouses = Tiphouse.all
    @repairs = Repair.all
    @kolroom = Kolroom.all
  end
end
