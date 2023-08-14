class AddReferencesToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :room, foreign_key: true, null: false
  end
end
