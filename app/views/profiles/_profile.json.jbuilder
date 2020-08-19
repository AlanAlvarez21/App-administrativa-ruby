json.extract! profile, :id, :foto, :nombre, :apellido, :direccion, :estado, :zip, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
