class CreateStandards < ActiveRecord::Migration[5.0]
  def change
    create_table :standards do |t|
      t.string :name, null: false
      t.text :description
      t.references :chapter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :validator, null: false, foreign_key: true
      t.references :frequency, null: false, foreign_key: true
      t.date :review_date
      t.integer :score
      t.text :scorer_note
      t.text :validator_note
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
