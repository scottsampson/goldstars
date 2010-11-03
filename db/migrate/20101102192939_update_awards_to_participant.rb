class UpdateAwardsToParticipant < ActiveRecord::Migration
  def self.up
    remove_column :awards, :user_id
    add_column :awards, :participant_id, :integer
    remove_column :awards, :award_id
    add_column :awards, :award_type_id, :integer
  end

  def self.down
    remove_column :awards, :participant_id
    add_column :awards, :user_id, :integer
    remove_column :awards, :award_type_id
    add_column :awards, :award_id, :integer
  end
end
