json.extract! task, :id, :name, :description, :due_date, :completed, :completed_date, :user_id, :user_note, :action_plan_id, :created_at, :updated_at
json.url task_url(task, format: :json)