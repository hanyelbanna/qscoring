class CreateHistoryScores < ActiveRecord::Migration[5.0]
  def change
    create_table :history_scores do |t|
      t.integer :score
      t.references :standard, null: false, foreign_key: true
      t.text :scorer_note
      t.text :validator_note
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :validator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
