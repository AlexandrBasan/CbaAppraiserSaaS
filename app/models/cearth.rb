class Cearth < ActiveRecord::Base
  belongs_to :earth
  belongs_to :aneart
  before_save :calc

  def calc
    self.auction = System.first.torg_earth
    self.location = System.first.location
    self.infrastructure = System.first.infrastructure
    @numb= 0.1
    self.diff_area = ((self.aneart.area.to_s.to_d/self.earth.total_area.to_s.to_d)-1)*100
end



end
