json.extract! document, :id, :name, :client, :body_text, :file_date, :created_at, :updated_at
json.url document_url(document, format: :json)
