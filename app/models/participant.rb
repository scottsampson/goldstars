class Participant < ActiveRecord::Base
  #note a participant actually has one role.  
  belongs_to  :role
  has_many :points
  has_many :awards
  
end
