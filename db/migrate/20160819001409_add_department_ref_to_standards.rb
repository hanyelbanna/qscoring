class AddDepartmentRefToStandards < ActiveRecord::Migration[5.0]
  def change
    add_reference :standards, :department, foreign_key: true
  end
end
