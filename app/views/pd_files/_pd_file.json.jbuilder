json.extract! pd_file, :id, :file_name, :created_at, :updated_at
json.url pd_file_url(pd_file, format: :json)
