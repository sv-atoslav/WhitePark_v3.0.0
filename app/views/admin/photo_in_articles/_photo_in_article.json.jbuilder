json.extract! photo_in_article, :id, :photo, :article, :created_at, :updated_at
json.url photo_in_article_url(photo_in_article, format: :json)
