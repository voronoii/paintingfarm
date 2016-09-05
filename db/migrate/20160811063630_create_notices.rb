class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :writer
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
