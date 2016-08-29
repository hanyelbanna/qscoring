class Managers::HistoryTrendDepartment < ApplicationRecord

  belongs_to :department, required: true

  scope :by_department, ->(department) { where(department_id: department) }

end
