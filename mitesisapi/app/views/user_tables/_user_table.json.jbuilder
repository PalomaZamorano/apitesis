json.extract! user_table, :id, :user_name, :user_mail, :user_rol, :user_cargo, :created_at, :updated_at
json.url user_table_url(user_table, format: :json)
