json.extract! question, :id, :title, :description, :upvotes, :created_at, :updated_at
json.url question_url(question, format: :json)
