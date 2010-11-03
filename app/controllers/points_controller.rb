class PointsController < ApplicationController
  # GET /points
  # GET /points.xml
  def index
    #all of this crap below is to do two queries instead of 40
    sql = "select sum(b.value) points,a.participant_id
      from points a,point_types b
      where a.point_type_id = b.id
      group by (a.participant_id)";
    @points = {}
    Point.find_by_sql(sql).each{|point| @points[point.participant_id] = point.points}
    sql = "select sum(b.num_points) cashed,a.participant_id 
      from awards a,award_types b 
      where a.award_type_id = b.id 
      group by (a.participant_id)"
    @awards = {}
    Award.find_by_sql(sql).each{|award| @awards[award.participant_id] = award.cashed}
    
    @participants = Participant.find(:all)
    @score = {}
    @points.each do |key,val|
      puts val.to_i.inspect
      puts key.to_i.inspect
      @score[key] = val.to_i - @awards[key].to_i
    end
    
    @participants.each do |p|
      p.score = @score[p.id].nil? ? 0 : @score[p.id]
    end
    @participants.sort! { |a,b| b.score <=> a.score }
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end

end
