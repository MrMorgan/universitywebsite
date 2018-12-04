json.extract! course, :id, :name, :credits, :department, :number, :created_at, :updated_at
json.url course_url(course, format: :json)
