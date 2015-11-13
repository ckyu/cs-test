if !@patient.nil?
  json.ssn            @patient.ssn
  json.name           @patient.name
  json.gender         @patient.gender_displayname
  json.date_of_birth  @patient.date_of_birth

  json.reports @patient.reports.all do |report|
    json.name       report.name
    json.physician  report.physician
    json.date       report.date.strftime("%Y-%m-%d")
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

else

  json.error "Patient does not exist."

end