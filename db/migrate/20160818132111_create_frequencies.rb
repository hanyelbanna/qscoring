class CreateFrequencies < ActiveRecord::Migration[5.0]
  def change
    create_table :frequencies do |t|
      t.string :name, null: false
      t.text :description
      t.integer :days, null: false, default: 30

      t.timestamps
    end
  end
end
