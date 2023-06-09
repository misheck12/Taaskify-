json.extract! task, :id, :title, :description, :customer_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
