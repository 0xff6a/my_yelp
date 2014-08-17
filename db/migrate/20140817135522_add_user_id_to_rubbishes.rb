class AddUserIdToRubbishes < ActiveRecord::Migration
  def change
    add_reference :rubbishes, :user, index: true
  end
end
