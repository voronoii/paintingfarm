class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :p_id
      t.integer :user_id
      t.string :user_name
      t.string :pwd
      t.text :content

      t.timestamps null: false
    end
  end
end
