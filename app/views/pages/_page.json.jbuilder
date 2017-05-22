json.extract! page, :id, :page_no, :text, :created_at, :updated_at
json.url page_url(page, format: :json)
