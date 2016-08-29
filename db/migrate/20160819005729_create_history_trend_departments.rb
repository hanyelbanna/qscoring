class CreateHistoryTrendDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :history_trend_departments do |t|
      t.decimal :score, precision: 4, scale: 1
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
