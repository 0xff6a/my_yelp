class CreateRubbishes < ActiveRecord::Migration
  def change
    create_table :rubbishes do |t|

      t.timestamps
    end
  end
end
