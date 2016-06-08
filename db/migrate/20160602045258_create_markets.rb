class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :artist_id
      
      #Artwork detail
      t.string :title
      t.string :price
      t.string :size
      t.string :genre
      t.string :year
      t.string :material
      
      #Artwork 설명
      t.text :content
      
      t.integer :like, default: 0
      t.integer :view, default: 0
  
      
      t.timestamps null: false
    end
  end
end
