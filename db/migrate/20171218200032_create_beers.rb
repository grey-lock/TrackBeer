class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string  :name
      t.float   :abv
      t.string  :style
      t.string  :color
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :brewery
      t.text    :comments
      
      t.timestamps null: false
    end
  end
end
