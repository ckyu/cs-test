json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :date_of_birth, :gender
  json.url patient_url(patient, format: :json)
end
