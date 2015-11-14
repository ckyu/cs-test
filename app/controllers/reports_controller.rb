class ReportsController < ApplicationController
  before_action :authenticate

  # POST /save
  def create
    @patient = Patient.find_by(ssn: patient_ssn)
    @reports = payload[patient_ssn]

    @reports.each do |name, raw_report|
      data = raw_report["data"]
      report = @patient.reports.build(report_params(name, raw_report))
      logger.debug "report.physician: #{report.physician}"
    
      if report.save
        data.each do |name, raw_data|
          lab_datum = report.lab_data.build(data_params(name, raw_data))
          if !lab_datum.save
            render text: "Error: Malformed data.", status: 500
          end
          logger.debug lab_datum.value_min
        end
      else
        render text: "Error: Malformed data.", status: 500
      end
    end

    render text: "OK", :status => 200

  end

  private

    def authenticate
      @token = Token.find_by(token: params[:token]) || nil
      if @token.nil? || @token.expired?
        render text: "ERROR: Invalid token.", status: 500
      end
    end

end
