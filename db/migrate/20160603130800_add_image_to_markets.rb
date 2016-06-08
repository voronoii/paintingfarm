class AddImageToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :image, :string
  end
end
