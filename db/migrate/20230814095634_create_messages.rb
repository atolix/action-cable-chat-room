class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :name, default: 'Anonymous'
      t.text :content, null: false

      t.timestamps
    end
  end
end
