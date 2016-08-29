class CreateActionPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :action_plans do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
