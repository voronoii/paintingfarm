class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :artist_id
      
      #Artwork detail
      t.string :title
      t.integer :price
      t.integer :genre_id
      t.integer :year
      t.string :material
      
      #Artwork 설명
      t.text :content
      
      t.integer :like, default: 0
      t.integer :view, default: 0
  
      
      t.timestamps null: false
    end
  end
end
