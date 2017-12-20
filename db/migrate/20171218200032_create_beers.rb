class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string  :name
      t.integer :abv
      t.string  :type
      t.string  :color
      t.integer :rating
      t.integer :brewery_id
      t.integer :user_id
      t.text    :comments
      
      t.timestamps null: false
    end
  end
end
