class AddReviewIdIdToRubbishes < ActiveRecord::Migration
  def change
    add_reference :rubbishes, :review, index: true
  end
end
