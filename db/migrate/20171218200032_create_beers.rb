class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.integer :abv
      t.timestamps null: false
    end
  end
end
