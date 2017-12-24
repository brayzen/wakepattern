json.extract! feedback, :id, :text, :userRated, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
