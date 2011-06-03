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
  
  # generates scores for *all* Participants in the database
  def self.scores
    {}.tap do |score|
      Point.sums.each do |key,val|
        score[key] = val.to_i - Award.sums[key].to_i
      end
    end
  end
  
end
