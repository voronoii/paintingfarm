class AddViewsToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :views, :integer, :default => 0
  end
end
