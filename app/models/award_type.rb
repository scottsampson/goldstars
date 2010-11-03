class AwardType < ActiveRecord::Base
  has_many :awards
  before_destroy :removable?
  
  def removable?
    self.awards.nil?
  end
end
