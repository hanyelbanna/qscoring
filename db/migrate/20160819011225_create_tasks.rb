class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.date :due_date
      t.boolean :completed, default: false
      t.date :completed_date
      t.references :user, null: false, foreign_key: true
      t.text :user_note
      t.references :action_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
