class PointType < ActiveRecord::Base
  has_many :points
  
  before_destroy :removable?
  
  def removable?
    self.points.nil?
  end

  
end
