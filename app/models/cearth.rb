class Cearth < ActiveRecord::Base
  belongs_to :earth
  belongs_to :aneart
  before_save :calc
  after_save :suma

  def calc
    self.auction = System.first.torg_earth
    self.location = System.first.location
    self.infrastructure = System.first.infrastructure

    self.diff_area = ((self.aneart.area.to_s.to_d/(self.earth.area_land.to_s.to_d*10000))**0.1-1)*100
    self.adj_cost_value = self.aneart.value_proposition_usdone.to_s.to_d*((100 + self.auction.to_s.to_i +
        self.location.to_s.to_i + self.infrastructure.to_s.to_i + self.diff_area.to_s.to_i).to_s.to_d/100)
end

  def suma
    @sum= Cearth.where(earth_id: self.earth_id)
    @median = @sum.sum(:adj_cost_value)/@sum.count
    Earth.find(self.earth_id).update(median: @median)


    @usd= (self.earth.area_land.to_s.to_d*10000)*self.earth.median.to_s.to_d
    Earth.find(self.earth_id).update(usd_market_value: @usd)

    @uah= self.earth.usd_market_value.to_s.to_d*Currency.first.value.to_s.to_d
    Earth.find(self.earth_id).update(uah_market_value: @uah)

    @euro= self.earth.uah_market_value.to_s.to_d/Currency.last.value.to_s.to_d
    Earth.find(self.earth_id).update(euro_market_value: @euro)
  end


end
