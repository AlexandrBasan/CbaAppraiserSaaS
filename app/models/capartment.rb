class Capartment < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :anaprtment
  before_save :calc



  def calc
    self.auction = Auction.first.value
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
     end

    if self.apartment.storey == 1 || self.apartment.storey == self.apartment.floors
                 if self.anaprtment.floor != 1 || self.anaprtment.floor != selfanaprtment.storeys
                   self.storey = -System.first.floor_apartment
                 else
                   self.storey = 0
                 end
    else
      self.storey = 0
 end
  if self.anaprtment.floor == 1 || self.anaprtment.floor == self.anaprtment.storeys
                if self.apartment.storey != 1 || self.apartment.storey != self.apartment.floors
                  self.storey = +System.first.floor_apartment
                else
                  self.storey = 0
                end
  else
    self.storey =0
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

 self.adj_cost_value = self.anaprtment.cost_one.to_s.to_d*((100 + self.auction + self.tip_house + self.storey + self.rooms).to_s.to_d/100)
    @med = Capartment.where(apartment_id: self.apartment_id).each
    self.median= @med.sum(:adj_cost_value)

      Apartment.find(self.apartment_id).update(uah_market_value: self.money_uah )


  end
  end
