class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.belongs_to :review, index: true

      t.timestamps
    end
  end
end
