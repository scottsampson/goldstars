class AddPointDescription < ActiveRecord::Migration
  def self.up
    add_column :points, :description, :text
  end

  def self.down
    remove_column :points, :description
  end
end
