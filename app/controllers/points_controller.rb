class PointsController < ApplicationController
  # GET /points
  # GET /points.xml
  def index

    @participants = Participant.find(:all, :include => :points)
    @score = Participant.scores
    
    @participants.each do |p|
      p.score = @score[p.id].nil? ? 0 : @score[p.id]
    end
    @participants.sort! { |a,b| b.score <=> a.score }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end
  
  def details
    @participant = Participant.find_by_id( params[:id] )
    @points = Point.find_all_by_participant_id( @participant )
    @awards = Award.find_all_by_participant_id( @participant )
    
    @stars = {  :current => 0,
                :spent => 0,
                :lifetime => 0 }
                
    @points.each{ |p| @stars[:lifetime] += p.point_type.value.to_i }
    @awards.each{ |a| @stars[:spent] += a.award_type.num_points.to_i }
    @stars[:current] = @stars[:lifetime] - @stars[:spent]
    
  end

  def rules
    @point_types = PointType.find(:all)
    @award_types = AwardType.find(:all)
    @point_types.sort! { |a,b| a.name <=> b.name }
    @award_types.sort! { |a,b| a.name <=> b.name }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end
end
