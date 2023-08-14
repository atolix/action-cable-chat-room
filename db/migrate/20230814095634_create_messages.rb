class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.string :name, default: 'Anonymous'

      t.timestamps
    end
  end
end
