class Participant < ActiveRecord::Base
  #note a participant actually has one role.  
  belongs_to  :role
  has_many :points
  has_many :awards
  @score
  
  def score=(score)
    @score = score
  end
  
  def score
    @score
  end
  
end
