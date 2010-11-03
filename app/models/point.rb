class Point < ActiveRecord::Base
  belongs_to :point_type
  belongs_to :participant
end
