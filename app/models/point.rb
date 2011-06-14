class Point < ActiveRecord::Base
  belongs_to :point_type
  belongs_to :participant
  
  #generates Point sums for *all* Participants in the database
  def self.sums
    sql = "select sum(b.value) points,a.participant_id
      from points a,point_types b
      where a.point_type_id = b.id
      group by (a.participant_id)"
    {}.tap do |points|
      Point.find_by_sql( sql ).each{
         |point| points[point.participant_id] = point.points }
    end
  end
  
end
