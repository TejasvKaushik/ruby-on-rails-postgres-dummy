json.extract! answer, :id, :title, :description, :upvotes, :created_at, :updated_at
json.url answer_url(answer, format: :json)
