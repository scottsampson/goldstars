class CreateAddDescriptionToAwards < ActiveRecord::Migration
  def self.up
    create_table :add_description_to_awards do |t|
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :add_description_to_awards
  end
end
