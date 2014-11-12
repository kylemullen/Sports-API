class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.string :description
      t.integer :players
      t.string :court
      t.string :created_in

      t.timestamps
    end
  end
end
