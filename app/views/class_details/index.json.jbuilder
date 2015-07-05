json.array!(@class_details) do |class_detail|
  json.extract! class_detail, :id, :user_id, :subject_id, :level_id
  json.url class_detail_url(class_detail, format: :json)
end
