class Capartment < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :anaprtment
  before_save :calc
after_save :bef_total


  def calc
    self.auction = System.first.torg_apartment
    if self.apartment.series_home == 1
                       if self.anaprtment.building_type == 1
                         self.tip_house = Tiphouse.find(1).o1
                         elsif self.anaprtment.building_type == 2
                         self.tip_house = Tiphouse.find(2).o1
                         elsif self.anaprtment.building_type == 3
                         self.tip_house = Tiphouse.find(3).o1
                         elsif self.anaprtment.building_type == 4
                         self.tip_house = Tiphouse.find(4).o1
                         end

    elsif self.apartment.series_home == 2
      if self.anaprtment.building_type == 1
        self.tip_house = Tiphouse.find(1).o2
      elsif self.anaprtment.building_type == 2
      self.tip_house = Tiphouse.find(2).o2
      elsif self.anaprtment.building_type == 3
      self.tip_house = Tiphouse.find(3).o2
      elsif self.anaprtment.building_type == 4
      self.tip_house = Tiphouse.find(4).o2
      end

    elsif self.apartment.series_home == 3
      if self.anaprtment.building_type == 1
        self.tip_house = Tiphouse.find(1).o3
      elsif self.anaprtment.building_type == 2
        self.tip_house = Tiphouse.find(2).o3
      elsif self.anaprtment.building_type == 3
        self.tip_house = Tiphouse.find(3).o3
      elsif self.anaprtment.building_type == 4
        self.tip_house = Tiphouse.find(4).o3
      end

    elsif self.apartment.series_home == 4
      if self.anaprtment.building_type == 1
        self.tip_house = Tiphouse.find(1).o4
      elsif self.anaprtment.building_type == 2
        self.tip_house = Tiphouse.find(2).o4
      elsif self.anaprtment.building_type == 3
        self.tip_house = Tiphouse.find(3).o4
      elsif self.anaprtment.building_type == 4
        self.tip_house = Tiphouse.find(4).o4
      end
    end

    if self.anaprtment.category_repair == 'Високоякісний'
    self.value_repair = Repair.first.high
           elsif self.anaprtment.category_repair == 'Євроремонт'
    self.value_repair = Repair.first.eurorepair
              elsif self.anaprtment.category_repair == 'Покращений'
    self.value_repair = Repair.first.advanced
             elsif self.anaprtment.category_repair == 'Простий'
    self.value_repair = Repair.first.simple
             elsif self.anaprtment.category_repair == 'Без оздоблення'
               self.value_repair = Repair.first.nodecoration
             else
               self.value_repair = 0
     end

    if self.apartment.storey == 1 || self.apartment.storey == self.apartment.floors
                 if self.anaprtment.floor != 1 || self.anaprtment.floor != self.anaprtment.storeys
                   self.storey = -System.first.floor_apartment.to_s.to_i
                 else
                   self.storey = 0.to_s.to_i
                 end
    else
      self.storey = 0.to_s.to_i
 end
  if self.anaprtment.floor == 1 || self.anaprtment.floor == self.anaprtment.storeys
                if self.apartment.storey != 1 || self.apartment.storey != self.apartment.floors
                  self.storey = +System.first.floor_apartment.to_s.to_i
                else
                  self.storey = 0.to_s.to_i
                end
  else
    self.storey =0.to_s.to_i
  end

    if self.apartment.number_rooms == 1
      if self.anaprtment.number_rooms == 1
        self.rooms = Kolroom.find(1).o1
      elsif self.anaprtment.number_rooms == 2
        self.rooms = Kolroom.find(2).o1
      elsif self.anaprtment.number_rooms == 3
        self.rooms = Kolroom.find(3).o1
      elsif self.anaprtment.number_rooms == 4
        self.rooms = Kolroom.find(4).o1
      end

    elsif self.apartment.number_rooms == 2
      if self.anaprtment.number_rooms == 1
        self.rooms = Kolroom.find(1).o2
      elsif self.anaprtment.number_rooms == 2
        self.rooms = Kolroom.find(2).o2
      elsif self.anaprtment.number_rooms == 3
        self.rooms = Kolroom.find(3).o2
      elsif self.anaprtment.number_rooms == 4
        self.rooms = Kolroom.find(4).o2
      end

    elsif self.apartment.number_rooms == 3
      if self.anaprtment.number_rooms == 1
        self.rooms = Kolroom.find(1).o3
      elsif self.anaprtment.number_rooms == 2
        self.rooms = Kolroom.find(2).o3
      elsif self.anaprtment.number_rooms == 3
        self.rooms = Kolroom.find(3).o3
      elsif self.anaprtment.number_rooms == 4
        self.rooms = Kolroom.find(4).o3
      end

    elsif self.apartment.number_rooms == 4
      if self.anaprtment.number_rooms == 1
        self.rooms = Kolroom.find(1).o4
      elsif self.anaprtment.number_rooms == 2
        self.rooms = Kolroom.find(2).o4
      elsif self.anaprtment.number_rooms == 3
        self.rooms = Kolroom.find(3).o4
      elsif self.anaprtment.number_rooms == 4
        self.rooms = Kolroom.find(4).o4
      end
    end

 self.adj_cost_value = self.anaprtment.cost_one.to_s.to_d*((100 + self.auction.to_s.to_i +
     self.tip_house.to_s.to_i + self.storey.to_s.to_i + self.rooms.to_s.to_i).to_s.to_d/100) + self.value_repair.to_s.to_d


  end
  end
def bef_total
  @sum= Capartment.where(apartment_id: self.apartment_id)
  @median = @sum.sum(:adj_cost_value)/@sum.count
  Apartment.find(self.apartment_id).update(median: @median)

  @usd= self.apartment.area.to_s.to_d*@median
  Apartment.find(self.apartment_id).update(usd_market_value: @usd)

  @uah= @usd*Currency.first.value.to_s.to_d
  Apartment.find(self.apartment_id).update(uah_market_value: @uah)

  @euro= @uah/Currency.last.value.to_s.to_d
  Apartment.find(self.apartment_id).update(euro_market_value: @euro)

  #@euro= self.apartment.uah_market_value.to_s.to_d/Currency.last.value.to_s.to_d
  #Apartment.find(self.apartment_id).update(euro_market_value: @euro)



end