class CreatePointTypes < ActiveRecord::Migration
  def self.up
    create_table :point_types do |t|
      t.string :name
      t.text :description
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :point_types
  end
end
