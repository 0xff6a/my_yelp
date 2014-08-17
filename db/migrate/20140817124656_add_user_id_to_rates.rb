class AddUserIdToRates < ActiveRecord::Migration
  def change
    add_reference :rates, :user, index: true
  end
end
