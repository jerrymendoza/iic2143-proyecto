json.extract! meeting, :id, :local, :like, :fecha, :hora, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
