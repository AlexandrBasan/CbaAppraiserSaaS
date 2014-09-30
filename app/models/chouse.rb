class Chouse < ActiveRecord::Base

  before_save :calc
  after_save :suma

  def calc

    if self.anhousehold.dcategory_repair == 'Високоякісний'
      self.category_repair = Repair.last.high
    elsif self.anhousehold.dcategory_repair == 'Євроремонт'
      self.category_repair = Repair.last.eurorepair
    elsif self.anhousehold.dcategory_repair == 'Покращений'
      self.category_repair = Repair.last.advanced
    elsif self.anhousehold.dcategory_repair == 'Простий'
      self.category_repair = Repair.last.simple
    elsif self.anhousehold.dcategory_repair == 'Без оздоблення'
      self.category_repair = Repair.last.nodecoration
    else
      self.category_repair = 0
    end
    self.auction = System.first.torg_house
    self.location = System.first.location_house
    self.infrastructure = System.first.infrastructura_house

    self.diff_area = ((self.anhousehold.area.to_s.to_d/(self.earth.area_land.to_s.to_d*10000))**0.1-1)*100
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
