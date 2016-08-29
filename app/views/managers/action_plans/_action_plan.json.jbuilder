json.extract! action_plan, :id, :name, :description, :closed, :created_at, :updated_at
json.url action_plan_url(action_plan, format: :json)