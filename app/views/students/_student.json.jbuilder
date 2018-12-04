json.extract! student, :id, :name, :sections, :created_at, :updated_at
json.url student_url(student, format: :json)
