class Role < ActiveRecord::Base
  has_many :participants
end
