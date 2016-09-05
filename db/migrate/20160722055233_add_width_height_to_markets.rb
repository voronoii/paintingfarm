class AddWidthHeightToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :width, :integer
    add_column :markets, :height, :integer
  end
end
