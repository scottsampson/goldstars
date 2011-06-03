class Award < ActiveRecord::Base
  belongs_to :award_type
  belongs_to :participant
  
  #generates Award sums for *all* Participants in the database
  def self.sums
    sql = "select sum(b.num_points) cashed,a.participant_id
      from awards a,award_types b
      where a.award_type_id = b.id
      group by (a.participant_id)"
    {}.tap do |awards|
      Award.find_by_sql( sql ).each{ |award| awards[award.participant_id] = award.cashed }
    end
  end
  
end
