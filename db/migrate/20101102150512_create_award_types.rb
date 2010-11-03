class CreateAwardTypes < ActiveRecord::Migration
  def self.up
    create_table :award_types do |t|
      t.string :name
      t.text :description
      t.integer :num_points

      t.timestamps
    end
  end

  def self.down
    drop_table :award_types
  end
end
