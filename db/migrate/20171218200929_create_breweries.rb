class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :town
      t.string :state_or_region
      t.string :country
      t.timestamps null: false
    end
  end
end
