json.extract! audiobook, :id, :title, :author, :pdf, :created_at, :updated_at
json.url audiobook_url(audiobook, format: :json)
