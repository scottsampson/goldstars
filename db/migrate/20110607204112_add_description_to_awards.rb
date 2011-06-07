class AddDescriptionToAwards < ActiveRecord::Migration
  def self.up
    add_column :awards, :description, :text
  end

  def self.down
    remove_column :awards, :description
  end
end
