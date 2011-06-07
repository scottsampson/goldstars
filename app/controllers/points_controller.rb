class PointsController < ApplicationController
  # GET /points
  # GET /points.xml
  def index

    @participants = Participant.find(:all, :include => :points)
    @scores = Participant.scores
    
    @participants.each do |p|
      p.score = @scores[p.id].nil? ? 0 : @scores[p.id]
      p.points.sort_by!{ |p| p['created_at'] }.reverse!
    end
    @participants.sort!{ |a,b| b.score <=> a.score }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end
  
  def details
    @participant = Participant.find_by_id( params[:id] )
    @points = @participant.points.order('created_at desc')
    @awards = @participant.awards.order('created_at desc')
    @stars = { :lifetime => 0, :spent => 0, :current => 0 }
    
    @stars[:lifetime] = @points.collect{ |p| p.point_type.value.to_i }.sum
    @stars[:spent] = @awards.collect{ |a| a.award_type.num_points.to_i }.sum
    @stars[:current] = @stars[:lifetime] - @stars[:spent]
  end

  def rules
    @point_types = PointType.order('value desc').find(:all)
    @award_types = AwardType.order('num_points asc').find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end
end
