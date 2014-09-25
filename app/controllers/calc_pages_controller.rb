class CalcPagesController < ApplicationController
  def calc_apartment
    @apartments = Apartment.all
    @anaprtments = Anaprtment.all
  end
end
