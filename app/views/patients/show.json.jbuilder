json.extract! @patient, :ssn, :name, :date_of_birth, :gender, :created_at, :updated_at

json.reports @reports do |report|
  json.name       report.name
  json.physician  report.physician
  json.date       report.date
  json.location   report.location

  json.data report.lab_data do |data|
    json.name   data.name
    json.value  data.value
    if data.unit != ""
      json.unit data.unit
    end
    if data.normal_range != ""
      json.normal_range data.normal_range
    end
  end
end