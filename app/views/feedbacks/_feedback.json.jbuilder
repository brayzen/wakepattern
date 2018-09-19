json.extract! feedback, :id, :handle, :text, :userRated, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
