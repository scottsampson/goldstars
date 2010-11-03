class Award < ActiveRecord::Base
  belongs_to :award_type
  belongs_to :participant
end
