class CreateReviews < ActiveRecord::Migration
  def change
  	  create_table :reviews do |t|
      t.integer :rating
      t.string :review
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
