module ReportsHelper
  def payload
    JSON.parse(params[:payload])
  end

  def patient_ssn
    payload.keys.first
  end

  def report_params(name, report)
    {:name => name,
     :physician => report["physician"] || "",
     :location => report["location"] || "",
     :date => report["date"] || ""}
  end

  def data_params(name, data)
    {:name => name,
     :value => data["value"],
     :unit => data["unit"] || "",
     :normal_range => data["normal_range"] || ""}
  end
end
