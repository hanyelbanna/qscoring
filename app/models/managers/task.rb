class Managers::Task < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :action_plan, required: true

  def self.text_search(query)
    if query.present?
      where("name @@ :q or description @@ :q", q: query)
    else
      all
    end
  end

  def self.options
    order(name: :asc)
  end

  scope :by_not_completed, -> { where(completed: 0) }
  scope :by_after_due, -> { where("tasks.due_date <= '#{Time.now.to_date}' ") }
  scope :by_user, ->(loged_user) { where("user_id = ?", loged_user) }
  
end
