json.extract! company, :id, :name, :site_url, :logo_url, :describe, :company_field_id, :created_at, :updated_at
json.url company_url(company, format: :json)
