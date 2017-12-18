class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|

      t.timestamps null: false
    end
  end
end
