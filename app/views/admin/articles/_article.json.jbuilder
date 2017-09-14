json.extract! article, :id, :title, :description, :published, :icon, :created_at, :updated_at
json.url article_url(article, format: :json)
