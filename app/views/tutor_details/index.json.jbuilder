json.array!(@tutor_details) do |tutor_detail|
  json.extract! tutor_detail, :id, :user_id, :subject_id, :level_id
  json.url tutor_detail_url(tutor_detail, format: :json)
end
