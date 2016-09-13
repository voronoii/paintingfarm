class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :artistid
      t.text :academic
      t.text :awards
      t.text :privateexhibitions
      t.text :teamexhibitions
      t.text :artfairs
      t.text :possessions
      t.text :etc

      t.timestamps null: false
    end
  end
end
