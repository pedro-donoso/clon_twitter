json.extract! tweet, :id, :description, :userName, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
