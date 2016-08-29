class CreateHistoryTrends < ActiveRecord::Migration[5.0]
  def change
    create_table :history_trends do |t|
      t.decimal :score, precision: 4, scale: 1

      t.timestamps
    end
  end
end
