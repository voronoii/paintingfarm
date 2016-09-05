class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :writer
      t.integer :writer_id
      t.string :pwd
      t.string :title
      t.text :content
      t.integer :views, :default => 0

      t.timestamps null: false
    end
  end
end
