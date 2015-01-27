json.array!(@shortlistings) do |shortlisting|
  json.extract! shortlisting, :id, :company_profile_id, :student_profile_id
  json.url shortlisting_url(shortlisting, format: :json)
end
