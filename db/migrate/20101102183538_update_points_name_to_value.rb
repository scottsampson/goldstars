class UpdatePointsNameToValue < ActiveRecord::Migration
  def self.up
    remove_column :point_types, :points
    add_column :point_types, :value, :integer
    remove_column :points, :user_id
    add_column :points, :participant_id, :integer
  end

  def self.down
    remove_column :point_types, :value
    add_column :point_types, :points, :integer
    remove_column :points, :participant_id
    add_column :points, :user_id, :integer
  end
end
