class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.text :image_url, :limit => 65535

      t.timestamps null: false
    end
  end
end
