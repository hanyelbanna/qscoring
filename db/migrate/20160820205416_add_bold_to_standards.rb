class AddBoldToStandards < ActiveRecord::Migration[5.0]
  def change
    add_column :standards, :bold, :boolean, null: false, default: false
  end
end
