class RemoveMarketIdFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :market_id, :integer
  end
end
