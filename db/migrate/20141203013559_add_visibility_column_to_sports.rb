class AddVisibilityColumnToSports < ActiveRecord::Migration
  def change
  	add_column :sports, :description_visible, :boolean, default: false
  end
end
