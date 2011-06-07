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
      Point.sums.each do |usr,pts|
        # score = points earned minus points spent
        score[usr] = pts.to_i - Award.sums[usr].to_i
      end
    end
  end
  
  def points_sum
    self.points.collect{ |point| point.point_type.value.to_i }.sum
  end
  
  def awards_sum
    self.awards.collect{ |award| award.award_type.num_points.to_i }.sum
  end
  
end
