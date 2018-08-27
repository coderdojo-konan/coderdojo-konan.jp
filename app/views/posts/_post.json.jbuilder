json.extract! post, :id, :body, :title, :published_at, :author_id, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
