class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string  :name
      t.integer :abv
      t.string  :type
      # t.string  :color # Feature: add this once app works
      t.integer :rating
      t.string  :brewery
      # t.integer :brewery_id # Feature: add this once app works
      t.integer :user_id
      t.text    :comments
      
      t.timestamps null: false
    end
  end
end
