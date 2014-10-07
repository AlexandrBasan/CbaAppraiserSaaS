class Chouse < ActiveRecord::Base
  belongs_to :house
  belongs_to :anhousehold
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


    self.diff_area = ((self.anhousehold.darea_building.to_s.to_d/self.house.total_area.to_s.to_d)**0.1-1)*100
    self.adj_cost_value = self.anhousehold.dvalue_proposition_usd_kvm.to_s.to_d*((100 + self.auction.to_s.to_i +
        self.location.to_s.to_i + self.infrastructure.to_s.to_i + self.diff_area.to_s.to_i).to_s.to_d/100)+category_repair
  end

  def suma
    @sum= Chouse.where(house_id: self.house_id)
    @median = @sum.sum(:adj_cost_value)/@sum.count
    House.find(self.house_id).update(median: @median.round)

    @usd_total = ((self.house.total_area).to_s).to_d
    @usd= @usd_total*@median.round
    House.find(self.house_id).update(usd_market_value: @usd.round)

    @uah= @usd.round*Currency.first.value.to_s.to_d
    House.find(self.house_id).update(uah_market_value: @uah.round)

    @euro= @uah.round/Currency.last.value.to_s.to_d
    House.find(self.house_id).update(euro_market_value: @euro.round)

    #@euro= self.house.uah_market_value.to_s.to_d/Currency.last.value.to_s.to_d
    #House.find(self.house_id).update(euro_market_value: @euro)

  end


end
